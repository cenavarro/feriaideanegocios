require 'spec_helper'

describe ProjectsController, "#create" do
  let(:project) { double(:project).as_null_object }
  let(:params) { { format: :json, project: PROJECT_ATTRIBUTES } }

  context "when is in available period" do

    before do
      allow(FairPeriod).to receive(:can_add_project?) { true }
      allow(Project).to receive(:new) { project }
    end

    it "initializes the project" do
      expect(Project).to receive(:new) { project }
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

