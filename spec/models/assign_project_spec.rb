require 'spec_helper'

describe AssignProject, "associations" do
  it { should belong_to(:judge) }
  it { should belong_to(:project) }
end

