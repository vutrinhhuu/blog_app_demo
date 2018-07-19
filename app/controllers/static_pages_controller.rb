class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.page(params[:page])
                                .per(Settings.feed_per_page)
    else
      @feed_items = Micropost.all.page(params[:page]).per(Settings.feed_per_page)
    end
  end

  def help; end

  def about; end

  def contact; end
end
