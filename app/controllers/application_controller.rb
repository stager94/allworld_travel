class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_locale, :set_default
  
  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
    @iso3locales = {:ru=>"RUS", :en=>"ENG", :ua=>"UKR"}
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').first
    I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
  end
  
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to '/'
  end

  def set_default
    @referer = Rails.application.routes.recognize_path(request.referrer) rescue {}
    @bredcrumb=""
    $countobj = 20
    if session[:perpaged].blank?
      $perpaged = 5 
    else
      $perpaged = session[:perpaged] 
      $countobj = 4*$perpaged
    end
    $keywords = I18n.t('meta.keywords')
    $descriptions = I18n.t('meta.descriptions')
    $sitedomain = 'allworld-travel.com'
    $setting = Allsetting.where(:default => true).first
  end

  def search
    # @results = GoogleCustomSearchApi.search("poker")
    if params[:q]
      page = params[:page] || 1
      @results = GoogleCustomSearchApi.search(params[:q],
                                              page: page)
    end
  end

  def api_search
    @countries = Country.where("name LIKE '#{params[:q]}%'").first 2
    @showplaces = Showplace.where("name LIKE '#{params[:q]}%'").first 10
    @result = (@countries.to_a + @showplaces.to_a).first(6)
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

end
