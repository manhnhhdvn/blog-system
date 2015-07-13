class EntriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
  	@entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      @feed_items = []
      render root_url
    end
  end

  def destroy
  end

  def show
    @entry = Entry.find(params[:id])
    @user = @entry.user
    @comments = @entry.comments.paginate(page: params[:page], per_page: 10)
  end

  private

    def entry_params
      params.require(:entry).permit(:content)
    end
end
