require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe "GET #new" do
    login_user

    it "assigns a blank task to the view" do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
      expect(response).to render_template(:new)
    end

  end

  context "POST create" do
    login_user

    it "redirects to pending task page" do
      post :create, task: attributes_for(:task)
      expect(response).to redirect_to(task_path(assigns(:task).id))
    end

  end

end