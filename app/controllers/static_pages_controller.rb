class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:share]

  def home
    @shares = Share.paginate(page: params[:page])
  end

  def share
    @share = current_user.shares.build if logged_in?
  end

  def histories
    @share = current_user.shares.build if logged_in?
  end

  def favorites
    @share = current_user.shares.build if logged_in?
  end

  def create_favorites
    @share = current_user.shares.build if logged_in?
  end

  def create_histories
    @share = current_user.shares.build if logged_in?
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

  def history_params
    params.require(:history).permit(:share_id)
  end


  def favorite_params
    params.require(:favorite).permit(:share_id)
  end

  def comment_params
    params.require(:comment).permit(:share_id, :description)
  end
end
