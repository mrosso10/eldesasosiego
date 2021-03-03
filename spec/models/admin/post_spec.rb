# frozen_string_literal: true

# generado con pg_rails

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }

  it 'se persiste' do
    expect(post).to be_persisted
  end
end
