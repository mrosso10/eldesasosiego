# generado con pg_rails

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'se persiste' do
    expect(user).to be_persisted
  end
end
