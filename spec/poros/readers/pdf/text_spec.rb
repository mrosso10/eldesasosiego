# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Readers::Pdf::Text do
  # This should return the minimal set of attributes required to create a valid
  # Admin::Post. As you add validations to Admin::Post, be sure to
  # adjust the attributes here as well.
  subject(:reader) { described_class.new(file) }

  let(:file) { file_fixture("example.pdf") }

  describe '#text' do
    context 'with a valid pdf' do
      it 'returns a valid string' do
        expect(reader.text).to start_with('A Simple PDF File')
      end
    end
  end
end
