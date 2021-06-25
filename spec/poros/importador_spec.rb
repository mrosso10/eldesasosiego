# frozen_string_literal: true

require 'rails_helper'

describe Importador do
  let(:instancia) do
    described_class.new.tap(&:load)
  end

  describe '#length' do
    subject { instancia.length }

    before { instancia.load }

    it { is_expected.to eq 807_967 }
  end

  describe '#guardar_paginas' do
    subject { instancia.guardar_paginas }

    it do
      subject
      expect(Pagina.count).to eq 416
    end
  end
end
