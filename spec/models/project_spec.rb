require 'spec_helper'

describe Project, "associations" do
  it { should have_and_belong_to_many(:participants) }
  it { should belong_to(:category) }
  it { should have_many(:assign_projects) }
  it { should have_many(:judges).through(:assign_projects) }
  it { should have_many(:ratings) }
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

describe Project, ".in_phase" do
  let!(:project_in_phase_1) { FactoryGirl.create(:project_with_participants, phase: 1) }
  let!(:project_in_phase_2) { FactoryGirl.create(:project_with_participants, phase: 2) }

  it "returns the projects in the given phase" do
    expect(described_class.in_phase(2)).to eq([project_in_phase_2])
  end
end

describe Project, ".current" do
  let!(:new_project) { FactoryGirl.create(:project_with_participants) }
  let!(:old_project) { FactoryGirl.create(:project_with_participants, created_at: 1.year.ago) }

  subject { Project.current }
  it { should include(new_project) }
  it { should_not include(old_project) }
end

describe Project, ".old" do
  let!(:new_project) { FactoryGirl.create(:project_with_participants) }
  let!(:old_project) { FactoryGirl.create(:project_with_participants, created_at: 1.year.ago) }

  subject { Project.old }
  it { should_not include(new_project) }
  it { should include(old_project) }
end

describe Project, "#add_participants" do
  let(:project) { FactoryGirl.create(:project_with_participants) }

  it "adds the participants to the project" do
    PARTICIPANTS_ATTRIBUTES.each do |key, participant_hash|
      expect(Participant).to receive(:where).with(carnet: participant_hash[:carnet]).and_call_original
    end
    project.add_participants(PARTICIPANTS_ATTRIBUTES)
  end

  context "when participant is not a new record" do
    let(:participant_proxy) { double(:participant_proxy, first_or_initialize: participant) }
    let(:participant) { FactoryGirl.create(:participant, carnet: A_CARNET) }

    before { allow(Participant).to receive(:where) { participant_proxy } }

    it "saves the new participant attributes" do
      expect_any_instance_of(Participant).to receive(:save)
      project.add_participants(PARTICIPANTS_ATTRIBUTES)
    end
  end

  it "persists participants to participants relationship" do
    expect {
      project.add_participants(PARTICIPANTS_ATTRIBUTES)
    }.to change { project.participants.count }.by(1)
  end
end

describe Project, "#total_rating" do
  let(:project) { FactoryGirl.create(:project_with_participants) }
  let(:rating_calculator) { double(:rating_calculator) }

  it "calls Feria::Ratings::Calculator#total_rating" do
    expect(Feria::Ratings::Calculator).to receive(:new).with(project) { rating_calculator }
    expect(rating_calculator).to receive(:total_rating)
    project.total_rating
  end
end

