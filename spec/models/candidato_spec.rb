# frozen_string_literal: true

# generado con pg_rails

require 'rails_helper'

RSpec.describe Candidato, type: :model do
  let(:candidato) { create(:candidato) }

  it 'se persiste' do
    expect(candidato).to be_persisted
  end
end
