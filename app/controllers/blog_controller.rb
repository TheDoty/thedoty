class BlogController < ApplicationController
  def index
    @posts = Post.paginate(:page => params[:page]).order(:created_at).reverse
  end

  def show
    @post = Post.find_by_friendly(params[:id])
  end
end
