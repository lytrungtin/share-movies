class SharesController < ApplicationController
  before_action :logged_in_user
  before_action :set_share, only: [:add_favorite, :destroy]

  def create
    @share = current_user.shares.build(share_params)
    if @share.save
      flash[:success] = "Share created!"
      redirect_to root_url
    else
      render 'static_pages/share'
    end
  end

  def destroy
    if current_user.shares.include?(@share) && @share.destroy
      flash[:success] = "Share destroyed!"
      redirect_to root_url
    else
      render 'static_pages/share'
    end
  end

  def add_favorite
    @favorite = current_user.favorites.build(share_id: @share.id)
    if @favorite.save
      flash[:success] = "Favorite created!"
      redirect_to root_url
    else
      render 'static_pages/share'
    end
  end

  private

  def share_params
    params.require(:share).permit(:url)
  end

  def set_share
    @share = Share.find(params[:share_id])
  end
end
