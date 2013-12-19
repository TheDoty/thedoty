class BlogController < ApplicationController
  skip_before_filter :check_user, :only => [ :index, :show, :feed ]

  def index
    @posts = Post.where("in_timeline = ?", true).paginate(:page => params[:page]).order(:created_at).reverse_order
  end

  def show
    @post = Post.find_by_friendly(params[:id])
  end

  def feed
    @posts = Post.where("in_timeline = ?", true).order(:created_at).reverse_order

    respond_to do |format|
      format.xml { render :layout => false }
    end
  end
end
