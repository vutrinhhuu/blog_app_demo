class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def new
    @micropost = Micropost.new(user_id: current_user.id)
  end

  def create
    @micropost = current_user.microposts.build micropost_params
    if @micropost.save
      flash[:success] = "Entry created"
      redirect_to root_url
    else
      @feed_items = current_user.feed.page(params[:page])
                                .per(Settings.feed_per_page)
      render :new
    end
  end

  def show
    @micropost = Micropost.find(params[:id])
    @comment = Comment.new
    @user = User.find(@micropost.user_id)
    @comments = @micropost.comments.page(params[:page]).per(5)
  end

  def destroy
    if @micropost.destroy
      flash[:success] = t("micropost_deleted")
    else
      flash[:danger] = t("micropost_cannot_delete")
    end
    redirect_to request.referrer || root_url
  end

  private
  def micropost_params
    params.require(:micropost).permit :title, :content, :picture
  end

  def correct_user
    @micropost = current_user.microposts.find_by id: params[:id]
    redirect_to root_url if @micropost.nil?
  end
end
