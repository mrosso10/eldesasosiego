# frozen_string_literal: true

# == Schema Information
#
# Table name: candidatos
#
#  id         :bigint           not null, primary key
#  longanismo :integer
#  texto      :string
#  tipo_query :string
#  tuiteable  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pagina_id  :bigint
#
# Indexes
#
#  index_candidatos_on_pagina_id  (pagina_id)
#
# Foreign Keys
#
#  fk_rails_...  (pagina_id => paginas.id)
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

RSpec.describe CandidatosController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Candidato. As you add validations to Candidato, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    attributes_for(:candidato)
  end

  let(:user) { create :user, :admin }

  before do
    sign_in user
  end

  describe 'GET #index' do
    subject do
      get :index, params: {}
    end

    it 'returns a success response' do
      subject
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      candidato = create(:candidato)
      get :show, params: { id: candidato.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      candidato = create(:candidato)
      get :edit, params: { id: candidato.to_param }
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        attributes_for(:candidato)
      end

      it 'updates the requested candidato' do
        candidato = create(:candidato)
        put :update, params: { id: candidato.to_param, candidato: new_attributes }
        candidato.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the candidato' do
        candidato = create(:candidato)
        put :update, params: { id: candidato.to_param, candidato: valid_attributes }
        expect(response).to redirect_to(candidato)
      end
    end
  end

  describe 'DELETE #destroy' do
    subject do
      delete :destroy, params: { id: candidato.to_param }
    end

    let!(:candidato) { create :candidato }

    it 'destroys the requested candidato' do
      expect { subject }.to change(Candidato, :count).by(-1)
    end

    it 'redirects to the candidatos list' do
      subject
      expect(response).to redirect_to(candidatos_url)
    end
  end
end
