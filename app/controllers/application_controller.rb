class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # CUD functions get the admin layout
  layout 'admin', :only => [ :new, :create, :edit, :update, :destroy ]

  # I rather prefer whitelists for security
  before_filter :check_user

  def check_user
    user = session[:user]
    if user
      unless user.is_admin
        # Reload the user in case someone has recently flipped this
        user = session[:user] = User.find(user.id)
        unless user.is_admin
          redirect_to controller: :sessions, action: :not_admin
        end
      end
    else
      if Rails.env.production?
        redirect_to '/auth/twitter'
      else
        redirect_to '/auth/developer'
      end
    end      
  end        
end
