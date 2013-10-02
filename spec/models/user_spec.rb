require 'spec_helper'

describe User do
  it { should have_valid(:email).when('test@test.com') }
  it { should_not have_valid(:email).when(nil, '', 'foo') }


# let(:user) { FactoryGirl.build(:user) } 

#   it "should validate" do 
#     user 
#     (:username => '',:email => '').should_not be_valid
#     (:username => '').should be_valid
#     (:email => '').should be_valid


    it { FactoryGirl.create(:user); should_not be_valid(:username => '',:email => '')}
  end

