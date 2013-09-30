require 'spec_helper'

describe Movie do
  it {should have_valid(:title).when('Matrix') }
  it {should_not have_valid(:title).when('', nil)}


  it {should have_valid(:year).when(1999) }
  it {should_not have_valid(:year).when('', nil, 'sdfafs')}


  it {should have_valid(:description).when('The best movie evah!!!!') }
  it {should_not have_valid(:description).when('', nil, 'short')}

  it {should have_valid(:director).when('The Watchoswki Brothers') }
  it {should_not have_valid(:director).when('', nil)}

  it {should have_valid(:cast).when('Keenau Reeves', 'Laurence Fishbourne', 'Carrie Moss') }
  it {should_not have_valid(:cast).when('', nil)}

end
