require 'spec_helper'

describe Review do
  it { should have_valid(:body).when("This movie does not suck")}
  it { should_not have_valid(:body).when("", nil)}

  it { should have_valid(:rating).when(5)}
  it { should_not have_valid(:rating).when(nil, "", "not")}

  it { should have_valid(:vote_count).when(0, 500, -100)}
  it { should_not have_valid(:vote_count).when(nil, "", "DURP")}

  it {should belong_to(:movie)}
  it {should belong_to(:user)}
  it {should have_many(:votes)}

end


# Vote has count, whe a user votes, it increments the count by one