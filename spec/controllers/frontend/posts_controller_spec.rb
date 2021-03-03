# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Frontend::PostsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      create(:post)
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      post = create(:post)
      get :show, params: { id: post.id }
      expect(response).to be_successful
    end
  end
end
