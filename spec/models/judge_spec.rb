require 'spec_helper'

describe Judge, "validations" do
  it { should validate_uniqueness_of(:username) }
end
