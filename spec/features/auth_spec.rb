require "rails_helper"

feature "register and login", :type => :feature do

  scenario "register" do
    visit "/users/sign_up"

    expect(page).to have_content("Sign up")

    within("#new_user") do

      fill_in "Email", with: "foobar@example.com"
      fill_in "Password", with: "123456"
      fill_in "Password confirmation", with: "123456"
    end

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully")

    user = User.last
    expect(user.email).to eq("foobar@example.com")
  end
end
