class AboutController < ApplicationController
  skip_before_filter :check_user, :only => [ :index ]
end
