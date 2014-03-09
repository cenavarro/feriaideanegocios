require 'spec_helper'

describe Project, "associations" do
  it { should have_and_belong_to_many(:participants) }
  it { should belong_to(:category) }
end

describe Project, "in_phase" do
  let!(:project_in_phase_1) { FactoryGirl.create(:project, phase: 1) }
  let!(:project_in_phase_2) { FactoryGirl.create(:project, phase: 2) }

  it "returns the projects in the given phase" do
    expect(described_class.in_phase(2)).to eq([project_in_phase_2])
  end
end

