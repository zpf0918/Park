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


     describe ".calculate_amount" do
       before do
         @time = Time.new(2017,7,15,8,0,0)
       end

       context "guest" do

         before do
           @parking = Parking.new(:parking_type => "guest", :user => @user, :start_at => @time)
         end

       it "30mins shoule be ￥2"  do
         @parking.end_at = @time + 30.minutes
         @parking.calculate_amount
         expect(@parking.amount).to eq(200)
       end

       it "60mins should be ￥2" do
         @parking.end_at = @time + 60.minutes
         @parking.calculate_amount
         expect(@parking.amount).to eq(200)
       end

       it "61mins should be ￥3" do
         @parking.end_at = @time + 61.minutes
         @parking.calculate_amount
         expect(@parking.amount).to eq(300)
       end

       it "90mins should be ￥3" do
         @parking.end_at = @time + 90.minutes
         @parking.calculate_amount
         expect(@parking.amount).to eq(300)
       end

       it "120mins should be ￥4" do
         @parking.end_at = @time + 120.minutes
         @parking.calculate_amount
         expect(@parking.amount).to eq(400)
       end

     end



     context "short-term" do

       before do
         @user = User.create( :email => "test@123.com", :password => "123456")
         @parking = Parking.new( :parking_type => "short-term",  :user => @user, :start_at => @time)
       end

     it "30mins should be ￥2" do
       @parking.end_at = @time + 30.minutes
       @parking.calculate_amount
       expect(@parking.amount).to eq(200)
     end

     it "60mins should be ￥2" do
       @parking.end_at = @time + 60.minutes
       @parking.calculate_amount
       expect(@parking.amount).to eq(200)
     end

     it "61mins should be ￥2" do
       @parking.end_at = @time + 61.minutes
       @parking.calculate_amount
       expect(@parking.amount).to eq(250)
     end

     it "90mins should be ￥2" do
       @parking.end_at = @time + 90.minutes
       @parking.calculate_amount
       expect(@parking.amount).to eq(250)
     end

     it "120mins should be ￥2" do
       @parking.end_at = @time + 120.minutes
       @parking.calculate_amount
       expect(@parking.amount).to eq(300)
     end
   end


   end

end
