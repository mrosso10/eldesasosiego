# frozen_string_literal: true

# generado con pg_rails

require 'rails_helper'

RSpec.describe PostCategory, type: :model do
  let(:post_category) { create(:post_category) }

  it 'se persiste' do
    expect(post_category).to be_persisted
  end
end
