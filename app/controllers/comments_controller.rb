class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      redirect_to request.referrer
    else
      flash[:danger] = "Cannot comment"
      redirect_to request.referrer
    end
  end

  def edit; end

  def update
    @comment = Comment.find params[:id]
    if @comment.update_attributes comment_params
      flash[:success] = "Update comment success"
      redirect_to request.referrer
    else
      render :micropost
    end
  end

  def destroy
    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to @micropost, notice: "Comment was destroyed."}
        format.js
      end
    else
      flash[:danger] = "Can't delete this comments"
    end
    redirect_to request.referrer || root_url
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
