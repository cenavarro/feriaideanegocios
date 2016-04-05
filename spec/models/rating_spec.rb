require 'spec_helper'

describe Rating, "associations" do
  it { should belong_to(:judge) }
  it { should belong_to(:project) }
end

describe Rating, "validations" do
  let(:criteria_error_message) { 'calificacion debe estar entre 0 y 100' }

  it { should ensure_inclusion_of(:criteria_1).in_range(0..100).with_message(criteria_error_message) }
  it { should ensure_inclusion_of(:criteria_2).in_range(0..100).with_message(criteria_error_message) }
  it { should ensure_inclusion_of(:criteria_3).in_range(0..100).with_message(criteria_error_message) }
  it { should ensure_inclusion_of(:criteria_4).in_range(0..100).with_message(criteria_error_message) }
  it { should ensure_inclusion_of(:criteria_5).in_range(0..100).with_message(criteria_error_message) }
  it { should ensure_inclusion_of(:phase).in_range(1..2).with_message('fase tiene que ser 1 o 2') }

  it { should validate_presence_of(:judge) }
  it { should validate_presence_of(:project) }
end

describe Rating, ".in_phase" do
  let(:judge) { FactoryGirl.create(:judge) }
  let(:project) { FactoryGirl.create(:project_with_participants) }
  let!(:rating_in_phase_1) { FactoryGirl.create(:rating, phase: 1, judge: judge, project: project) }
  let!(:rating_in_phase_2) { FactoryGirl.create(:rating, phase: 2, judge: judge, project: project) }

  it "returns the ratings in the given phase" do
    expect(described_class.in_phase(2)).to eq([rating_in_phase_2])
  end
end

describe Rating, "#average" do
  context "when is in phase 1" do
    let!(:rating) { FactoryGirl.create(:rating_with_info, criteria_1: 90, criteria_2: 30, criteria_3: 40, criteria_4: 80, criteria_5: 85, criteria_8: 90) }
    subject { rating.average }
    it { should eq(69.17) }
  end

  context "when is in phase 2" do
    let(:rating) do
      FactoryGirl.create(:rating_with_info, phase: 2,
        criteria_1: 81, criteria_2: 82, criteria_3: 83, criteria_4: 84, criteria_5: 85,
        criteria_6: 86, criteria_7: 87, criteria_8: 88)
    end
    subject { rating.average }
    it { should eq(84.5) }
  end
end

