# Renders the home page.
class Frontend::StaticPagesController < FrontendController
  def login_as
    if Rails.env.development? || desarrollador?
      usuario = User.find(params[:id])
      sign_in(:user, usuario)
    end
    redirect_to '/'
  end
  
  def home
    @title = "Home"
  end
end
