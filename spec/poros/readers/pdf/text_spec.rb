# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Readers::Pdf::Text do
  subject(:reader) { described_class.new(file) }

  let(:file) { file_fixture('example.pdf') }

  describe '#text' do
    context 'with a valid pdf' do
      it 'returns a valid string' do
        expect(reader.text).to start_with('A Simple PDF File')
      end
    end
  end
end
