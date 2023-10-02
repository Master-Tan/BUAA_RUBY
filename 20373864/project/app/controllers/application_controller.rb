class ApplicationController < ActionController::Base
  # disable the CSRF token
  protect_from_forgery with: :null_session

  # # disable cookies (no set-cookies header in response)
  # before_action :destroy_session

  # disable the CSRF token
  skip_before_action :verify_authenticity_token

  helper_method :current_user, :user_logged_in?, :current_shop, :shop_logged_in?,
                :current_deliver, :deliver_logged_in?, :current_administrator, :administrator_logged_in?,
                :current_canteen, :canteen_logged_in?

  before_action :set_SameSite
  def set_SameSite
    response.headers['SameSite'] = 'None'
  end

  # after_action :set_cookies

  # def set_cookies
  #   cookies[:session] = session
  # end

  def api_ok(opts = {})
    render json: {}, status: opts[:status]
  end

  def api_error(opts = {})
    render json: {}, status: opts[:status]
  end

  # def authenticate_user!
  #   token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
  #
  #   user_username = options.blank?? nil : options[:username]
  #   user = user_username && User.find_by(username: user_username)
  #
  #   if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
  #     self.current_user = user
  #   else
  #     return unauthenticated!
  #   end
  # end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
    # @current_user ||= User.find_by(id: 1)
  end

  def user_logged_in?
    current_user != nil
    # true
  end

  def current_administrator
    @current_administrator ||= Administrator.find_by(id: session[:current_administrator_id])
    # @current_user ||= User.find_by(id: 1)
  end

  def administrator_logged_in?
    current_administrator != nil
    # true
  end

  def current_shop
    @current_shop ||= Shop.find_by(id: session[:current_shop_id])
    # @current_user ||= User.find_by(id: 1)
  end

  def shop_logged_in?
    current_shop != nil
    # true
  end

  def current_deliver
    @current_deliver ||= Deliver.find_by(id: session[:current_deliver_id])
    # @current_user ||= User.find_by(id: 1)
  end

  def deliver_logged_in?
    current_deliver != nil
    # true
  end

  def current_canteen
    @current_canteen ||= Canteen.find_by(id: session[:current_canteen_id])
    # @current_user ||= User.find_by(id: 1)
  end

  def canteen_logged_in?
    current_canteen != nil
    # true
  end
end
