require 'spec_helper'

describe Judge, "associations" do
  it { should have_many(:assign_projects) }
  it { should have_many(:projects).through(:assign_projects) }
  it { should have_many(:ratings) }
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

describe Judge, "#admin?" do
  subject { FactoryGirl.create(:judge) }

  its(:admin?) { should be_false }
end

describe Judge, "#unrated_projects" do
  let(:judge) { FactoryGirl.create(:judge, phase: 1) }
  let(:rated_project) { FactoryGirl.create(:project_with_participants, phase: 1) }
  let(:unrated_project) { FactoryGirl.create(:project_with_participants, phase: 1) }
  let!(:rating) { FactoryGirl.create(:rating, project_id: rated_project.id, judge_id: judge.id) }

  before { judge.projects << [rated_project, unrated_project] }

  subject { judge.unrated_projects }

  it { should == [unrated_project] }
end

