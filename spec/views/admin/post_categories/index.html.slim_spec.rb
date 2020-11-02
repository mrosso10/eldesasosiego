# generado con pg_rails

require 'rails_helper'

RSpec.describe "admin/post_categories/index", type: :view do
  PgRails::ConfiguradorRSpec.helpers(self)

  let(:user) { create(:user, :admin) }
  let!(:post_categories) { create_list(:admin_post_category, rand(10..20))}

  before(:each) do
    sign_in user
    @clase_modelo = assign(:clase_modelo, Admin::PostCategory)
    smart_listing_create :post_categories, Admin::PostCategory.all, partial: 'admin/post_categories/listing'

    assign(:filtros, PgRails::FiltrosBuilder.new(
      self, Admin::PostCategory, []))
  end

  it "renders a list of admin/post_categories" do
    render
    assert_select "table", 1
  end
end
