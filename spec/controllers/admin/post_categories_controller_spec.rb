# frozen_string_literal: true

# == Schema Information
#
# Table name: post_categories
#
#  id                 :bigint           not null, primary key
#  deleted_at         :datetime
#  nombre             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  actualizado_por_id :bigint
#  creado_por_id      :bigint
#
# Indexes
#
#  index_post_categories_on_actualizado_por_id  (actualizado_por_id)
#  index_post_categories_on_creado_por_id       (creado_por_id)
#
# Foreign Keys
#
#  fk_rails_...  (actualizado_por_id => users.id)
#  fk_rails_...  (creado_por_id => users.id)
#

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

RSpec.describe Admin::PostCategoriesController do
  # This should return the minimal set of attributes required to create a valid
  # PostCategory. As you add validations to PostCategory, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) do
    attributes_for(:post_category)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostCategoriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:user) { create :user, :admin }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      create(:post_category)
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      post_category = create(:post_category)
      get :show, params: { id: post_category.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      post_category = create(:post_category)
      get :edit, params: { id: post_category.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new PostCategory' do
        expect do
          post :create, params: { post_category: valid_attributes }, session: valid_session
        end.to change(PostCategory, :count).by(1)
      end

      it 'redirects to the created post_category' do
        post :create, params: { post_category: valid_attributes }, session: valid_session
        expect(response).to redirect_to([:admin, PostCategory.last])
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        attributes_for(:post_category)
      end

      it 'updates the requested post_category' do
        post_category = create(:post_category)
        put :update, params: { id: post_category.to_param, post_category: new_attributes },
                     session: valid_session
        post_category.reload
        expect(post_category.nombre).to eq new_attributes[:nombre]
      end

      it 'redirects to the post_category' do
        post_category = create(:post_category)
        put :update, params: { id: post_category.to_param, post_category: valid_attributes },
                     session: valid_session
        expect(response).to redirect_to([:admin, post_category])
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested post_category' do
      post_category = create(:post_category)
      expect do
        delete :destroy, params: { id: post_category.to_param }, session: valid_session
      end.to change(PostCategory.kept, :count).by(-1)
    end

    it 'redirects to the post_categories list' do
      post_category = create(:post_category)
      delete :destroy, params: { id: post_category.to_param }, session: valid_session
      expect(response).to redirect_to(admin_post_categories_url)
    end
  end
end
