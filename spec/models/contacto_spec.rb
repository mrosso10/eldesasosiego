# frozen_string_literal: true

# generado con pg_rails

require 'rails_helper'

RSpec.describe Contacto, type: :model do
  let(:contacto) { create(:contacto) }

  it 'se persiste' do
    expect(contacto).to be_persisted
  end
end
