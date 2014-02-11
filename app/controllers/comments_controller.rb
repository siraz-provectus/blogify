class CommentsController < ApplicationController
 
  expose (:comments) {
    Comment.pending.page(params[:page])
  }
  expose :comment, attributes: :comment_params

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def load
  end

  def create
    if user_signed_in?
      comment.save
    else
      comment.valid?
      comment.save if verify_recaptcha(:model => comment, :message => "Please enter the correct captcha!")
    end 
  end

  def update
    comment.update(comment_params)
  end

  def destroy
    comment.destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :body, :status)
    end
end