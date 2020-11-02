# generado con pg_rails

require 'rails_helper'

RSpec.describe "admin/post_categories/edit", type: :view do
  PgRails::ConfiguradorRSpec.helpers(self)

  let(:user) { create(:user, :admin) }

  before(:each) do
    sign_in user
    @post_category = assign(:post_category, create(:admin_post_category).decorate)
    @clase_modelo = assign(:clase_modelo, Admin::PostCategory)
  end

  it "renders the edit post_category form" do
    render

    assert_select "form[action=?][method=?]", admin_post_category_path(@post_category), "post" do

      assert_select "input[name=?]", "admin_post_category[nombre]"
    end
  end
end
