require 'spec_helper'

describe Vote do
  it {should have_valid(:value).when(-1, 1,)}
  it {should_not have_valid(:value).when("DURP", nil, -2, 2, 0, " ")}

  it {should belong_to(:review)}
  it {should belong_to(:user)}

end
