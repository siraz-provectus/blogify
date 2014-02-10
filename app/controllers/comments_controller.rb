class CommentsController < ApplicationController
 
  expose :comments
  expose :comment, attributes: :comment_params

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    comment.save
    puts comment.errors.messages
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :body, :status)
    end
end