require 'rails_helper'

RSpec.describe Parking, type: :model do




     describe ".save" do
       before do
         @time = Time.new(2017,7,15,8,0,0)
       end

       context "guest" do

         before do
           @parking = Parking.new(:parking_type => "guest", :user => @user, :start_at => @time)
         end

       it "30mins shoule be ￥2"  do
         @parking.end_at = @time + 30.minutes
         @parking.save
         expect(@parking.amount).to eq(200)
       end

       it "60mins should be ￥2" do
         @parking.end_at = @time + 60.minutes
         @parking.save
         expect(@parking.amount).to eq(200)
       end

       it "61mins should be ￥3" do
         @parking.end_at = @time + 61.minutes
         @parking.save
         expect(@parking.amount).to eq(300)
       end

       it "90mins should be ￥3" do
         @parking.end_at = @time + 90.minutes
         @parking.save
         expect(@parking.amount).to eq(300)
       end

       it "120mins should be ￥4" do
         @parking.end_at = @time + 120.minutes
         @parking.save
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
       @parking.save
       expect(@parking.amount).to eq(200)
     end

     it "60mins should be ￥2" do
       @parking.end_at = @time + 60.minutes
       @parking.save
       expect(@parking.amount).to eq(200)
     end

     it "61mins should be ￥2" do
       @parking.end_at = @time + 61.minutes
       @parking.save
       expect(@parking.amount).to eq(250)
     end

     it "90mins should be ￥2" do
       @parking.end_at = @time + 90.minutes
       @parking.save
       expect(@parking.amount).to eq(250)
     end

     it "120mins should be ￥2" do
       @parking.end_at = @time + 120.minutes
       @parking.save
       expect(@parking.amount).to eq(300)
     end
   end

   context "long-term" do
     before do
       @user = User.create( :email => "test@123.com", :password => "123456")
       @parking = Parking.new( :parking_type => "long-term",  :user => @user, :start_at => @time)
     end

     it "360mins should be ￥12" do
      
       @parking.end_at = @time + 360.minutes
       @parking.save
       expect(@parking.amount).to eq(1200)
     end

     it "361mins should be ￥16" do
       @parking.end_at = @time + 400.minutes
       @parking.save
       expect(@parking.amount).to eq(1600)
     end
   end


   end

end
