require "rails_helper"

feature "parking", :type => :feature do
  scenario "short-term parking" do
    user = User.create!( :email => "test@12.com", :password => "123456")
    sign_in(user)

    visit "/"

    choose "短期费率"

    click_button "开始计费"
    click_button "结束计费"
    expect(page).to have_content("￥2")
  end
end
