require 'spec_helper'
require 'rails_helper'

describe ItemsController do
  describe "GET index" do
    it_behaves_like "requires sign in" do
      let(:action) { get :index }
    end

    before { set_current_user }

    it "sets the @items variable" do
      item1 = Fabricate(:item)
      item2 = Fabricate(:item)
      get :index
      expect(assigns(:items)).to match_array([item1, item2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET new" do
    it_behaves_like "requires sign in" do
      let(:action) { get :new }
    end

    before { set_current_user }

    it "sets the @item variable" do
      get :new
      expect(assigns(:item)).to be_new_record
      expect(assigns(:item)).to be_an_instance_of(Item)

    end

    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST create" do
    context "unauthenticated users" do
      it_behaves_like "requires sign in" do
        let(:action) { post :create, item: Fabricate.attributes_for(:item) }
      end

      it "does not create a new item" do
        clear_current_user
        post :create, item: Fabricate.attributes_for(:item)
        expect(Item.count).to eq(0)
      end
    end

    context "authenticated users"
      before { set_current_user }

      context "with valid input" do
        it "creates a new item" do
          post :create, item: Fabricate.attributes_for(:item)
          expect(Item.count).to eq(1)
        end
        it "creates a new item associated with the logged in user" do
          post :create, item: Fabricate.attributes_for(:item)
          expect(current_user.items.count).to eq(1)
        end
        it "redirects to the item index page" do
          post :create, item: Fabricate.attributes_for(:item)
          expect(response).to redirect_to items_path
        end
      end
  end

  describe "GET show" do
    it_behaves_like "requires sign in" do
      let(:action) { get :show, id: Fabricate(:item).id }
    end

    before { set_current_user }

    it "sets the @item variable" do
      item = Fabricate(:item)
      get :show, id: item.id
      expect(assigns(:item)).to eq(item)
    end

    it "renders the show template" do
      item = Fabricate(:item)
      get :show, id: item.id
      expect(response).to render_template :show
    end
  end

  describe "GET edit" do
    it_behaves_like "requires sign in" do
      let(:action) { get :show, id: Fabricate(:item).id }
    end

    before { set_current_user }

    it "sets the @item variable" do
      item = Fabricate(:item)
      get :edit, id: item.id
      expect(assigns(:item)).to eq(item)
    end

    it "renders the edit template" do
      item = Fabricate(:item)
      get :edit, id: item.id
      expect(response).to render_template :edit
    end
  end

  describe "PATCH update" do
    context "unauthenticated users" do
      it_behaves_like "requires sign in" do
        let(:action) { put :update, item: Fabricate.attributes_for(:item) }
      end

      it "does not update the item for unauthenticated users" do
        item = Fabricate(:item)
        patch :update, id: item.id , item: Fabricate.attributes_for(:item, name: "New name")
        expect(Item.first.name).to eq(item.name)
      end
    end

    context "authenticated users" do
      before { set_current_user }

      it "updates the item" do
      end

      it "redirects to the item's show page" do
      end
    end
  end
end