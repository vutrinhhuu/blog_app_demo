class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.page(params[:page])
                                .per(Settings.feed_per_page)
    else
      following_ids = "SELECT micropost_id FROM (SELECT micropost_id, COUNT(id) FROM comments
                                                GROUP BY micropost_id
                                                ORDER BY COUNT(id) DESC)"
      @most_comment = Micropost.where("id IN (#{following_ids})")
      @feed_items = @most_comment.page(params[:page]).per(Settings.feed_per_page)
    end
  end

  def help; end

  def about; end

  def contact; end
end
