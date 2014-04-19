class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :authenticate_user!



  # Rescue from Action Denied
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert=> exception.message
  end

  # Rescue from typing in a non-existing URL to a POI
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_url, :alert=> exception.message
  end

  # Rescue from typing in a non-existing URL
  rescue_from ActionController::RoutingError do |exception|
    redirect_to not_found_url
  end

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
  end

  #called by last route matching unmatched routes.  Raises RoutingError which will be rescued from in the same way as other exceptions.
  def raise_not_found!
    raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  end

  #render 500 error
  def render_error(e)
    respond_to do |f|
      f.html{ render :template => "errors/500", :status => 500 }
      f.js{ render :partial => "errors/ajax_500", :status => 500 }
    end
  end

  #render 404 error
  def render_not_found(e)
    respond_to do |f|
      f.html{ render :template => "errors/404", :status => 404 }
      f.js{ render :partial => "errors/ajax_404", :status => 404 }
    end
  end

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.role == "admin"
      flash[:alert] = "You do not have permission to access this page."
      redirect_to root_path
    end
  end


end
