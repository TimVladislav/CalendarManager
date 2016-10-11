require 'rails_helper'
require 'spec_helper'

RSpec.describe TasksController, :type => :controller do
  TasksController.skip_before_filter :user_signed
  let(:user){FactoryGirl.create(:user)}
  before {allow(controller).to receive(:current_user){user}}
  describe "create action" do
    it "redirect to @task after created new task" do
      post :create, task: {title: 'Title', description: 'description', dt: '12.12.2017'}
      response.should redirect_to(assigns(:task))
    end
    it "renders new page again if validations fail" do
      post :create, task: {title: nil, description: 'description', dt: '12.12.2017'}
      response.should render_template("new")
    end
  end
end
