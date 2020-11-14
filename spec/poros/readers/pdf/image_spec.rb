# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Readers::Pdf::Image do
  subject(:reader) { described_class.new(file) }

  let(:file) { file_fixture('clean-image-pdf.pdf') }

  describe '#text' do
    context 'with an easy to scan pdf' do
      it 'returns a valid string' do
        # Ignored because it takes way too long
        expect(reader.text).to include('Non-text-searchable')
      end
    end
  end
end
