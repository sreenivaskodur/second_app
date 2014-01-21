require 'spec_helper'

describe "AuthenticationPages" do
    subject{page}

    describe "signin page" do
        before{visit signin_path}

        it{should have_title('Sign in')}
        it{should have_content('Sign in')}

        describe "invalid signin attempt" do
            before{click_button "Sign in"}

            it{should have_title('Sign in')}
            it{should have_selector('div.alert.alert-error')}
        end
    end
end
