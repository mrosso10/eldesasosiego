# generado con pg_rails

require 'rails_helper'

RSpec.describe "admin/posts/edit", type: :view do
  PgRails::ConfiguradorRSpec.helpers(self)

  let(:user) { create(:user, :admin) }

  before(:each) do
    sign_in user
    @post = assign(:post, create(:admin_post).decorate)
    @clase_modelo = assign(:clase_modelo, Admin::Post)
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", admin_post_path(@post), "post" do

      assert_select "input[name=?]", "admin_post[titulo]"

      assert_select "input[name=?]", "admin_post[activo]"

      assert_select "input[name=?]", "admin_post[slug]"

      assert_select "textarea[name=?]", "admin_post[contenido]"

      assert_select "select[name=?]", "admin_post[post_category_id]"

      assert_select "select[name=?]", "admin_post[post_category_id]"
    end
  end
end
