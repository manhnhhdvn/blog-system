class StaticPagesController < ApplicationController
  def home
    #entry = current_user.entries.build if logged_in?
  	if current_user.nil?
  	 @feed_items = Entry.all.paginate(page: params[:page], per_page: 10)
  	else
  	 @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
  	end
  end

  def help
  end

  def about
  end

  def contact
  end
end
