require 'spec_helper'

describe Project, "associations" do
  it { should have_and_belong_to_many(:participants) }
end
