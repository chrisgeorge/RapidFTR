require 'spec_helper'

describe PasswordResetController do

  it "should show success message on successful reset request" do
    user = build_and_save_user(:user_name => "jdoe")
    post :create, :user_name => "jdoe"
    flash[:notice].should == "Thank you. A RapidFTR administrator will contact you shortly."
    User.find_by_user_name("jdoe").request_password_reset.should be_true
  end
  
  def build_user( options = {} )
    options.reverse_merge!( {
      :user_name => "user_name_#{rand(10000)}",
      :full_name => 'full name',
      :password => 'password',
      :password_confirmation => options[:password] || 'password',
      :email => 'email@ddress.net',
      :user_type => 'user_type'
    })
    user = User.new( options) 
    user
  end
  
  def build_and_save_user( options = {} )
    user = build_user(options)
    user.save
    user
  end
end