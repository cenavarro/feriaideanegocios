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

