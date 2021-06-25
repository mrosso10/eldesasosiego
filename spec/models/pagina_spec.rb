# frozen_string_literal: true

# generado con pg_rails

require 'rails_helper'

RSpec.describe Pagina, type: :model do
  let(:pagina) { create(:pagina) }

  it 'se persiste' do
    expect(pagina).to be_persisted
  end

  describe '#generar_candidatos' do
    subject { pagina.generar_candidatos }

    before do
      pagina.update(texto: File.read('spec/fixtures/pagina.txt'))
    end

    it do
      expect { subject }.to change(Candidato, :count).by(13)
    end
  end
end
