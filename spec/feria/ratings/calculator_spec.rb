require 'feria/ratings/calculator'

describe Feria::Ratings::Calculator, "#total_rating" do
  let(:rating_1) { double(:rating, average: 73.333) }
  let(:rating_2) { double(:rating, average: 88.333) }
  let(:ratings) { [rating_1, rating_2] }
  let(:ratings_proxy) { double(:ratings_proxy) }
  let(:project) { double(:project, ratings: ratings_proxy, phase: 1) }

  before { allow(ratings_proxy).to receive(:in_phase) { ratings } }

  after { described_class.new(project).total_rating }

  it "gets the ratings of the project" do
    expect(project).to receive(:ratings)
  end

  it "scopes the ratings depending of the project phase" do
    expect(ratings_proxy).to receive(:in_phase).with(project.phase) { ratings }
  end

  it "calculates the averages of the ratings" do
    total_rating = described_class.new(project).total_rating
    expect(total_rating).to eq(80.83)
  end
end

