class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  @title = nil

  layout :layout_by_resource
  after_filter :store_location

  protected  
  
  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        request.path != "/users/edit" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || edit_user_registration_path
  end

  def after_sign_out_path_for(resource)
    session[:previous_url] || request.referer
  end

  def after_update_path_for(resource)
    session[:previous_url] || edit_user_registration_path
  end

  def layout_by_resource
  	if devise_controller?
  		"iframe"
  	else
  		"application"
  	end
  end

end
