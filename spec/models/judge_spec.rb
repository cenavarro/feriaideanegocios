require 'spec_helper'

describe Judge, "validations" do
  it { should validate_uniqueness_of(:username) }
end

describe Judge, "associations" do
  it { should have_many(:project) }
end

