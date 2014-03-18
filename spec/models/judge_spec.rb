require 'spec_helper'

describe Judge, "validations" do
  it { should validate_uniqueness_of(:username) }
end

describe Judge, "associations" do
  it { should have_many(:projects) }
end

describe Judge, "in_phase" do
  let!(:judge_in_phase_1) { FactoryGirl.create(:judge, phase: 1) }
  let!(:judge_in_phase_2) { FactoryGirl.create(:judge, phase: 2) }

  it "returns the judges in the given phase" do
    expect(described_class.in_phase(1)).to eq([judge_in_phase_1])
  end
end

describe Judge, "#add_projects" do
  let(:project) { FactoryGirl.create(:project_with_participants) }
  let(:judge) { FactoryGirl.create(:judge) }

  it "persits projects to the projects relationship" do
    expect {
      judge.add_projects [project.id]
    }.to change { judge.projects.count }.by(1)
  end
end

