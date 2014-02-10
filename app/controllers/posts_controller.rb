class PostsController < ApplicationController

  expose :posts
  expose :post, attributes: :post_params

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if post.save
      redirect_to post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if post.update(post_params)
      redirect_to post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def post_params
    params.require(:post).permit(
      :category_id, 
      :title, 
      :body,
      :tag_list
    )
  end
end