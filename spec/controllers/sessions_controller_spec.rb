require 'spec_helper'
require 'rails_helper'

describe SessionsController do
  describe "GET new" do
    it "should redirect to root_path for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to root_path
    end

    it "should render the new template for unauthenticated users" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    let(:alice) {Fabricate(:user)}

    context "with valid credentials" do
      before do
        post :create, email: alice.email, password: alice.password
      end

      it "logs in the user" do
        expect(session[:user_id]).to eq(alice.id)
      end

      it "redirects to the root path" do
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid credentials" do
      before do
        post :create, email: alice.email, password: "somewrongpassword"
      end

      it "does not log in the user" do
        expect(session[:user_id]).to be_nil
      end

      it "renders the new template" do
        expect(response).to render_template :new
      end
    end
  end

  describe "GET destroy" do
    let(:alice) {Fabricate(:user)}

    before do
      session[:user_id] = alice.id
      get :destroy
    end

    it "emptys the session's user_id" do
      expect(session[:user_id]).to be_nil
    end

    it "redirects to the root path" do
      expect(response).to redirect_to root_path
    end
  end

end