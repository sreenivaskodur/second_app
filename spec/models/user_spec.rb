require 'spec_helper'

describe User do
	before do
		@user=User.new(name:"Example Name",email:"email@example.com",
		password:"passwd",password_confirmation:"passwd")
	end

	subject{@user}

	it{should respond_to(:name)}
	it{should respond_to(:email)}
	it{should respond_to(:password_digest)}
	it{should respond_to(:password)}
	it{should respond_to(:password_confirmation)}
	it{should respond_to(:authenticate)}
	it{should respond_to(:remember_token)}

	it{should be_valid}

	describe "remember token" do
		before{@user.save}
		its{:remember_token}{should_not be_blank}
	end

	describe "password test using authenticate method" do
		before{@user.save}
		let(:curr_user){User.find_by(email:@user.email)}

		describe "authenticate successfully when password matches" do
			it{should eq curr_user.authenticate(@user.password)}
		end

		describe "authentication failure when there is a mismatch" do
			let(:user_with_invalid_passwd){curr_user.authenticate("invalid password")}
			it{should_not eq user_with_invalid_passwd}
		end
	end

	describe "set name to empty string and the result should be invalid" do
		before{@user.name=""}
		it{should_not be_valid}
	end

	describe "set name to length beyond 50 chars and result should be invalid" do
		before{@user.name="a" * 51}
		it{should_not be_valid}
	end

	describe "the result should be invalid for these email-Id's " do
		addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
        addresses.each do |invalid_id|
        	before{@user.email=invalid_id}
        	it{should_not be_valid}
        end
	end

	describe "the result should be valid for these email-Id's " do
		addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
		addresses.each do |valid_id|
			before{@user.email=valid_id}
			it{should be_valid}
		end
	end

	describe "creating a entry with duplicate email-Id and the result should be not valid" do
		before do
			email_with_dup_email = @user.dup
			email_with_dup_email.save
		end

		it{should_not be_valid}
	end

	describe "when password is empty reuslt should be not valid" do
		before do
			@user = User.new(name:"example",email:"user@example.com",
				password:"",password_confirmation:"")
		end
		it{should_not be_valid}
	end

	describe "when there is mismatch in password, result should be not valid" do
		before do
			@user.password_confirmation = "something else"
		end
		it{should_not be_valid}
	end

	describe "when password is lessthan 6 chars in length, then it is invalid" do
		before{@user.password = "a" * 5}
		it{should_not be_valid}
	end
end