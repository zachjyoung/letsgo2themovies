require 'spec_helper'

describe User do
  it { should have_valid(:email).when('test@test.com') }
  it { should_not have_valid(:email).when(nil, '', 'foo') }

  it { should have_many(:reviews)}
  it { should have_many(:votes)}
  
end
