require 'feria/projects/factory'
require 'spec_helper'

describe Feria::Projects::Factory, "#build" do
  let(:project) { double(:project).as_null_object }
  let(:project_params) { PROJECT_ATTRIBUTES.dup }

  before { allow(Project).to receive(:new) { project } }

  after { described_class.new(project_params).build }

  it "initializes a new Project given the params" do
    expect(Project).to receive(:new).with(
      name: project_params[:name],
      category_id: project_params[:category_id],
      motivation: project_params[:motivation],
      description: project_params[:description],
      advantage: project_params[:advantage],
      motivated: project_params[:motivated],
      phase: 1
    )
  end

  it "add the participants to the project" do
    expect(project).to receive(:add_participants).with(project_params[:participants_attributes])
  end

  it "returns the initialize project" do
    returned_project = described_class.new(project_params).build
    expect(returned_project).to eq(project)
  end
end

