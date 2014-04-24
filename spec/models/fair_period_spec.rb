require 'spec_helper'

describe FairPeriod, ".can_add_project" do
  let!(:fair_period) { FactoryGirl.create(:fair_period, started_at: 1.month.ago, ended_at: 3.day.ago) }

  context "when today is in the available period" do
    before { allow(Date).to receive(:today) { 5.days.ago } }

    subject { described_class.can_add_project? }
    it { should be_true }
  end

  context "when today is not in the available period" do
    subject { described_class.can_add_project? }
    it { should be_false }
  end
end

