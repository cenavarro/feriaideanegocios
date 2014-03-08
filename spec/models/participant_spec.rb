require 'spec_helper'

describe Participant, "associations" do
  it { should have_and_belong_to_many(:projects) }
  it { should belong_to(:career) }
end
