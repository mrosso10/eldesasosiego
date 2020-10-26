# Renders the home page.
class Frontend::HomeController < FrontendController
  def login_as
    if Rails.env.development? || desarrollador?
      usuario = User.find(params[:id])
      sign_in(:user, usuario)
    end
    redirect_to '/'
  end
  
  def index
    @title = "Home"
  end
end
