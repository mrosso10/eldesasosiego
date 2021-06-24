# frozen_string_literal: true

# generado con pg_rails

require 'rails_helper'

RSpec.describe Pagina, type: :model do
  let(:pagina) { create(:pagina) }

  it 'se persiste' do
    expect(pagina).to be_persisted
  end
end
