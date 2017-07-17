require 'rails_helper'

RSpec.describe Parking, type: :model do

   describe ".validate_end_at_with_amount" do

     it "is invalid without amount" do
       parking = Parking.new( :parking_type => "guest",
                              :start_at => Time.now - 6.hours,
                              :end_at => Time.now)
       expect( parking ).to_not be_valid
     end

     it "is invalid without end_at" do
       parking = Parking.new( :parking_type => "guest",
                              :start_at => Time.now - 6.hours,
                              :amount => 100)
       expect( parking ).to_not be_valid
     end
   end

   context "guest" do
     describe ".calculate_amount" do
       it "30mins shoule be ￥2" do
         parking = Parking.new( :parking_type => "guest", :start_at => Time.now, :end_at => Time.now + 30.minutes)
         parking.calculate_amount
         expect(parking.amount).to eq(200)
       end

       it "60mins should be ￥2" do
         t = Time.now
         parking = Parking.new( :parking_type => "guest", :start_at => t, :end_at => t + 60.minutes)
         parking.calculate_amount
         expect(parking.amount).to eq(200)
       end

       it "61mins should be ￥3" do
         t = Time.now
         parking = Parking.new( :parking_type => "guest", :start_at => t, :end_at => t + 61.minutes)
         parking.calculate_amount
         expect(parking.amount).to eq(300)
       end

       it "90mins should be ￥3" do
         t = Time.now
         parking = Parking.new( :parking_type => "guest", :start_at => t, :end_at => t + 90.minutes)
         parking.calculate_amount
         expect(parking.amount).to eq(300)
       end

       it "120mins should be ￥4" do
         t = Time.now
         parking = Parking.new( :parking_type => "guest", :start_at => t, :end_at => t + 120.minutes)
         parking.calculate_amount
         expect(parking.amount).to eq(400)
       end

     end
   end

   context "short-term" do
    describe ".calculate_amount" do
     it "30mins should be ￥2" do
       t = Time.now
       parking = Parking.new( :parking_type => "short-term", :start_at => t, :end_at => t + 30.minutes)
       parking.user = User.create( :email => "test@123.com", :password => "123456")
       parking.calculate_amount
       expect(parking.amount).to eq(200)
     end

     it "60mins should be ￥2" do
       t = Time.now
       parking = Parking.new( :parking_type => "short-term", :start_at => t, :end_at => t + 60.minutes)
       parking.user = User.create( :email => "test@123.com", :password => "123456")
       parking.calculate_amount
       expect(parking.amount).to eq(200)
     end

     it "61mins should be ￥2" do
       t = Time.now
       parking = Parking.new( :parking_type => "short-term", :start_at => t, :end_at => t + 61.minutes)
       parking.user = User.create( :email => "test@123.com", :password => "123456")
       parking.calculate_amount
       expect(parking.amount).to eq(250)
     end

     it "90mins should be ￥2" do
       t = Time.now
       parking = Parking.new( :parking_type => "short-term", :start_at => t, :end_at => t + 90.minutes)
       parking.user = User.create( :email => "test@123.com", :password => "123456")
       parking.calculate_amount
       expect(parking.amount).to eq(250)
     end

     it "120mins should be ￥2" do
       t = Time.now
       parking = Parking.new( :parking_type => "short-term", :start_at => t, :end_at => t + 120.minutes)
       parking.user = User.create( :email => "test@123.com", :password => "123456")
       parking.calculate_amount
       expect(parking.amount).to eq(300)
     end
   end


   end

end
