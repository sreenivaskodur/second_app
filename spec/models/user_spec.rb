require 'spec_helper'

describe User do
	before{@user=User.new(name:"Example Name",email:"email@example.com")}

	subject{@user}

	it{should respond_to(:name)}
	it{should respond_to(:email)}
	it{should be_valid}

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
end