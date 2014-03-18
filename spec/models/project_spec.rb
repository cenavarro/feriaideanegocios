require 'spec_helper'

describe Project, "associations" do
  it { should have_and_belong_to_many(:participants) }
  it { should belong_to(:category) }
end

describe Project, "validations" do
  it { should accept_nested_attributes_for(:participants).allow_destroy(true) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:motivation) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:advantage) }

  context "when has at least one participant" do
    let(:participant) { FactoryGirl.create(:participant) }
    let(:project) { FactoryGirl.create(:project, participant_ids: [participant.id]) }

    subject { project.valid? }

    it { should be_true }
  end

  context "when doesn't have participants" do
    it "raises an error" do
      expect{
        FactoryGirl.create(:project)
      }.to raise_error
    end
  end
end

describe Project, "in_phase" do
  let!(:project_in_phase_1) { FactoryGirl.create(:project_with_participants, phase: 1) }
  let!(:project_in_phase_2) { FactoryGirl.create(:project_with_participants, phase: 2) }

  it "returns the projects in the given phase" do
    expect(described_class.in_phase(2)).to eq([project_in_phase_2])
  end
end

