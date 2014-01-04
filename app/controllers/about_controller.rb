class AboutController < ApplicationController
  skip_before_filter :check_user, :only => [ :index, :about ]

  def about
    render layout: false
  end
end
