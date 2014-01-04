class PostsController < ApplicationController
  # C_UD functions get the admin layout
  layout 'admin', :only => [ :new, :create, :edit, :update, :destroy ]

  def new
    @post = Post.new
  end

  def create
    @post = Post.author(params[:post][:title], params[:post][:body])

    if @post
      flash[:notice] = 'Post Created'
      redirect_to url_for(controller: :admin, action: :index)
    else
      render action: :new
    end
  end
end
