require 'spec_helper'

describe Participant, "associations" do
  it { should have_and_belong_to_many(:projects) }
  it { should belong_to(:career) }
end

describe Participant, "validations" do
  it { should validate_uniqueness_of(:carnet) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:carnet) }
  it { should validate_presence_of(:email) }
  it { should allow_value("test@test.com").for(:email) }
  it { should_not allow_value("test.com").for(:email) }
end

