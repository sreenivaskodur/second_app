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
end