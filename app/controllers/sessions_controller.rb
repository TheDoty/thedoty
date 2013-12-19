class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :create
  skip_before_filter :check_user, :only => [ :create, :not_admin, :destroy ]

  def create
    if Rails.env.production? and not available_providers.includes?(params[:provider])
      render text: "Aren't you a laugh riot?"
    else
      hash = request.env['omniauth.auth']
      @user = User.find_by_hash_provider_and_hash_uid(hash['provider'], hash['uid'])

      if @user and @user.is_admin
        session[:user] = @user
        redirect_to controller: :admin, action: :index
      else
        @user = User.create(hash_provider: hash['provider'], hash_uid: hash['uid'])
        session[:user] = @user
        redirect_to action: :not_admin
      end
    end
  end

  def destroy
    session[:user] = nil
    redirect_to '/'
  end

  protected
  def self.available_providers
    [ 'twitter' ]
  end
end
