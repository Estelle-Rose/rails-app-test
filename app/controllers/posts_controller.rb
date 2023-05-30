class PostsController < ApplicationController
  def index
    posts = Post.all
    if posts.any?
      render :index, locals: { posts: }, status: :ok
    else
      render(json: { message: 'posts not found' }, status: :not_found)
    end
  end
  def show
    post_id = params[:id]
    post = Post.find(post_id)
    if post.present?
      render :show, locals: { post: }, status: :ok
    else
      render(json: { message: 'post not found' }, status: :not_found)
    end
  end
  def edit
    post = Post.new
  end
end
