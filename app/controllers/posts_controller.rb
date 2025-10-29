class PostsController < ApplicationController
  before_action :authenticate_member, only: [ :new, :create ]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if current_member.posts.create(post_params)
      flash[:notice] = "Post sent!"
      redirect_to root_url
    else
      flash.now[:alert] = "Error while sending post"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
