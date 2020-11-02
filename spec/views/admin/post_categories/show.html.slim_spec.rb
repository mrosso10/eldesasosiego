# generado con pg_rails

require 'rails_helper'

RSpec.describe "admin/post_categories/show", type: :view do
  PgRails::ConfiguradorRSpec.helpers(self)

  let(:user) { create(:user, :admin) }

  before(:each) do
    sign_in user
    @post_category = assign(:post_category, create(:admin_post_category).decorate)
    @clase_modelo = assign(:clase_modelo, Admin::PostCategory)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
  end
end
