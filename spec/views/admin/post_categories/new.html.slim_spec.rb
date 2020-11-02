# generado con pg_rails

require 'rails_helper'

RSpec.describe "admin/post_categories/new", type: :view do
  PgRails::ConfiguradorRSpec.helpers(self)

  let(:user) { create(:user, :admin) }

  before(:each) do
    sign_in user
    @post_category = assign(:post_category, build(:admin_post_category).decorate)
    @clase_modelo = assign(:clase_modelo, Admin::PostCategory)
  end

  it "renders new admin_post_category form" do
    render

    assert_select "form[action=?][method=?]", admin_post_categories_path, "post" do

      assert_select "input[name=?]", "admin_post_category[nombre]"
    end
  end
end
