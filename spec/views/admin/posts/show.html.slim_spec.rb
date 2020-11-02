# generado con pg_rails

require 'rails_helper'

RSpec.describe "admin/posts/show", type: :view do
  PgRails::ConfiguradorRSpec.helpers(self)

  let(:user) { create(:user, :admin) }

  before(:each) do
    sign_in user
    @post = assign(:post, create(:admin_post).decorate)
    @clase_modelo = assign(:clase_modelo, Admin::Post)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Titulo/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/Mytext/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
