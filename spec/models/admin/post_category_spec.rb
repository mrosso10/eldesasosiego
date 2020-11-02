# generado con pg_rails

require 'rails_helper'

RSpec.describe Admin::PostCategory, type: :model do
  let(:post_category) { create(:admin_post_category) }

  it 'se persiste' do
    expect(post_category).to be_persisted
  end
end
