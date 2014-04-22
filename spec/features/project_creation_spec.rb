require 'spec_helper'

describe ProjectsController, type: :controller do
  let(:params) { { format: :json, project: PROJECT_ATTRIBUTES } }

  it "create the project and the participant" do
    allow(FairPeriod).to receive(:can_add_project?) { true }
    post :create, params
  end
end

