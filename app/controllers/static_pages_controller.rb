class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:share]

  def home
    @shares = Share.paginate(page: params[:page])
  end

  def share
    @share = current_user.shares.build if logged_in?
  end

  def histories
    share_ids = current_user.histories.pluck(:share_id)
    @shares = Share.where(id: share_ids).paginate(page: params[:page])
  end

  def favorites
    share_ids = current_user.favorites.pluck(:share_id)
    @shares = Share.where(id: share_ids).paginate(page: params[:page])
  end

  def create_comments
    comment = current_user.comments.build(comment_params)
    if comment.save
      flash[:success] = "Comment created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end



  private

  def comment_params
    params.require(:comment).permit(:share_id, :description)
  end
end
