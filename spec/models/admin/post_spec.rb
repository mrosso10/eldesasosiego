# generado con pg_rails

require 'rails_helper'

RSpec.describe Admin::Post, type: :model do
  let(:post) { create(:admin_post) }

  it 'se persiste' do
    expect(post).to be_persisted
  end
end
