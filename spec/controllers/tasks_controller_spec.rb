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

  describe "show action" do

    it "redirect root, if an position is not find" do
      task = create(:task)
      get :show, {id: task.id}
      response.should redirect_to '/'
    end

  end

  describe "update action" do

    it "redirect to task, if an task is update" do
      task = create(:task)
      put :update, {id: task.id}
      response.should redirect_to(assigns(:task))
    end

    it "redirect to edit template, if an task is not update" do
      task = create(:task, owner: user.email)
      put :update, {id: task.id, task: {title: "qw"}}
      response.should render_template("edit")
    end

    it "redirect to task, if an task owner is not correct" do
      task = create(:task)
      put :update, {id: task.id, task: {title: "Title1"}}
      response.should redirect_to(assigns(:task))
    end

  end

end
