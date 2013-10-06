require 'spec_helper'

describe User do
  it { should have_valid(:email).when('test@test.com') }
  it { should_not have_valid(:email).when(nil, '', 'foo') }


  it { should have_valid(:username).when('mallgoats') }
  it { should_not have_valid(:username).when(nil, '') }

  
end
