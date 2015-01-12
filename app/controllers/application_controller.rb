class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_admin_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end

  # def url_options(options={})
  #   ({})
  #     .merge( {:locale => ( params[:locale] || I18n.locale)} )
  #     .merge(options)
  # end

  def redirect_to_admin
    path_for_redirect = "/#{I18n.locale}/#{ActiveAdmin.application.default_namespace}/#{params[:a]}#{"?"+request.query_string  if request.query_parameters.count > 0 }"
    #path_for_redirect = "/#{I18n.locale}/#{ActiveAdmin.application.default_namespace}/#{params[:a]}#{"?"+params.map { |key, value| "#{key}=#{value}" }.join('&')   }"
    #render inline: "#{params.map{|key, value| "#{key}=#{value}" }.join('&')}"
    redirect_to path_for_redirect
    #redirect_to url_for()
  end

  def user_for_paper_trail
    admin_user_signed_in? ? current_admin_user : 'Unknown user'
  end
end
