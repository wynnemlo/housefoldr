require 'spec_helper'
require 'rails_helper'

describe UsersController do
  describe "GET new" do
    it "sets @user as a new empty user" do
      get :new
      expect(assigns(:user)).to be_new_record
      expect(assigns(:user)).to be_an_instance_of(User)
    end
  end

  describe "POST create" do
    context "with valid input" do
      before do
        post :create, user: Fabricate.attributes_for(:user)
      end

      it "redirects to root path" do
        expect(response).to redirect_to root_path
      end

      it "creates the new user" do
        expect(User.count).to eq(1)
      end

      it "logs in the new user" do
        expect(session[:user_id]).to_not be_nil
      end
    end

    context "with invalid input" do
      before do
        post :create, user: {email: "alice@example.com", name: "Alice Chan"}
      end

      it "should render the new template" do
        expect(response).to render_template :new
      end
      it "does not create the user" do
        expect(User.count).to eq(0)
      end
      it "sets @user" do
        expect(assigns(:user)).to be_an_instance_of(User)
      end
    end
  end
end