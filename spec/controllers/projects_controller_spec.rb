require 'spec_helper'

describe ProjectsController, "#create" do
  let(:project) { FactoryGirl.create(:project_with_participants) }
  let(:project_factory) { double(:project_factory, build: project) }
  let(:params) { { format: :json, project: PROJECT_ATTRIBUTES.with_indifferent_access } }

  context "when is in available period" do

    before do
      allow(FairPeriod).to receive(:can_add_project?) { true }
      allow(Feria::Projects::Factory).to receive(:new) { project_factory }
    end

    it "initializes the project" do
      expect(Feria::Projects::Factory).to receive(:new).with(
        PROJECT_ATTRIBUTES.with_indifferent_access
      )
      post :create, params
    end

    context "when project is a valid project" do
      it "saves the project" do
        expect(project).to receive(:save) { true }
        post :create, params
      end

      it "renders with status 200" do
        post :create, params
        expect(response.status).to eq(200)
      end
    end

    context "when project is invalid" do
      before { allow(project).to receive(:save) { false } }

      it "renders with error status" do
        post :create, params
        expect(response.status).to eq(422)
      end
    end
  end

  context "when is not in available period" do
    before { allow(FairPeriod).to receive(:can_add_project?) { false } }

    it "renders with error status" do
      post :create, params
      expect(response.status).to eq(500)
    end
  end
end

