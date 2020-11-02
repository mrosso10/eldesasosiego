# generado con pg_rails

require 'rails_helper'

RSpec.describe "admin/posts/index", type: :view do
  PgRails::ConfiguradorRSpec.helpers(self)

  let(:user) { create(:user, :admin) }
  let!(:posts) { create_list(:admin_post, rand(10..20))}

  before(:each) do
    sign_in user
    @clase_modelo = assign(:clase_modelo, Admin::Post)
    smart_listing_create :posts, Admin::Post.all, partial: 'admin/posts/listing'

    assign(:filtros, PgRails::FiltrosBuilder.new(
      self, Admin::Post, []))
  end

  it "renders a list of admin/posts" do
    render
    assert_select "table", 1
  end
end
