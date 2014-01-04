class BlogController < ApplicationController
  skip_before_filter :check_user, :only => [ :index, :show, :feed ]

  def index
  end

  def page
    @posts = Post.where("in_timeline = ?", true).paginate(:page => params[:page]).order(:created_at).reverse_order
    
    post_ary = @posts.map { |p| p.for_json }

    respond_to do |format|
      format.json { render json: { total_pages: @posts.total_pages, posts: post_ary }}
    end
  end

  def show
    @post = Post.find_by_friendly(params[:id])

    respond_to do |format|
      format.html { render }
      format.json { render json: @post.for_json }
    end      
  end

  def feed
    @posts = Post.where("in_timeline = ?", true).order(:created_at).reverse_order

    respond_to do |format|
      format.xml { render :layout => false }
    end
  end
end
