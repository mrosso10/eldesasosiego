# == Schema Information
#
# Table name: admin_posts
#
#  id                     :bigint           not null, primary key
#  activo                 :boolean
#  contenido              :text
#  deleted_at             :datetime
#  slug                   :string
#  titulo                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  actualizado_por_id     :bigint
#  admin_post_category_id :bigint           not null
#  creado_por_id          :bigint
#
# Indexes
#
#  index_admin_posts_on_actualizado_por_id      (actualizado_por_id)
#  index_admin_posts_on_admin_post_category_id  (admin_post_category_id)
#  index_admin_posts_on_creado_por_id           (creado_por_id)
#
# Foreign Keys
#
#  fk_rails_...  (actualizado_por_id => users.id)
#  fk_rails_...  (admin_post_category_id => admin_post_categories.id)
#  fk_rails_...  (creado_por_id => users.id)
#
# generado con pg_rails

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe Admin::PostsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Admin::Post. As you add validations to Admin::Post, be sure to
  # adjust the attributes here as well.

  let(:post_category) { create :post_category }
  let(:post_category) { create :post_category }

  let(:valid_attributes) {
    attributes_for(:admin_post).merge(post_category_id: post_category.id, post_category_id: post_category.id)
  }

  let(:invalid_attributes) {
    {
      post_category: nil,
      post_category: nil,
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Admin::PostsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:user) { create :user, :admin }
  before do
    sign_in user
  end


  describe "GET #index" do
    it "returns a success response" do
      create(:post)
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      post = create(:post)
      get :show, params: {id: post.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      post = create(:post)
      get :edit, params: {id: post.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin::Post" do
        expect {
          post :create, params: {admin_post: valid_attributes}, session: valid_session
        }.to change(Admin::Post, :count).by(1)
      end

      it "redirects to the created admin_post" do
        post :create, params: {admin_post: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Admin::Post.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {admin_post: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:admin_post)
      }

      it "updates the requested admin_post" do
        post = create(:post)
        put :update, params: {id: post.to_param, admin_post: new_attributes}, session: valid_session
        post.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin_post" do
        post = create(:post)
        put :update, params: {id: post.to_param, admin_post: valid_attributes}, session: valid_session
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        post = create(:post)
        put :update, params: {id: post.to_param, admin_post: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_post" do
      post = create(:post)
      expect {
        delete :destroy, params: {id: post.to_param}, session: valid_session
      }.to change(Admin::Post.without_deleted, :count).by(-1)
    end

    it "redirects to the admin_posts list" do
      post = create(:post)
      delete :destroy, params: {id: post.to_param}, session: valid_session
      expect(response).to redirect_to(admin_posts_url)
    end
  end

end