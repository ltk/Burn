module Features
  module SessionHelpers
    def sign_in_user_with(email, password)
      visit '/sign_in'

      fill_in 'Account email',    :with => email
      fill_in 'Password', :with => password
      click_button 'Log In'
    end

    def sign_in_user
      user = create(:user)
      sign_in_user_with(user.account_email, user.password)
    end

    def sign_out_user
      visit "/sign_out"
    end
  end
end
