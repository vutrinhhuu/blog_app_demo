class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @comment = current_user.comments.build comment_params
    @micropost = @comment.micropost
    if @comment.save
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    else
      flash[:danger] = "Cannot comment"
      redirect_to request.referrer
    end
  end

  def edit; end

  def update
    @comment = Comment.find params[:id]
    if @comment.update_attributes comment_params
      @cmt_updated = Comment.find @comment.id
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    else
      flash[:danger] = "Invalid change"
      redirect_to request.referrer
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to request.referrer }
        format.js
      end
    else
      redirect_to request.referrer || root_url
      flash.now[:danger] = "Can't delete this comments"
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :micropost_id
  end

  def correct_user
    @comment = current_user.comments.find_by id: params[:id]
    redirect_to root_url if @comment.nil?
  end
end
