class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
  	# @comment = current_user.comments.build(comment_params)
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to @entry
    else
      redirect_to @entry
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :entry_id, :user_id)
    end
end
