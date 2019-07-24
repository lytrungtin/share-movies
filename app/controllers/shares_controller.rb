class SharesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

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
    @share = Share.find(params[:share_id])
    if @share.destroy
      flash[:success] = "Share destroyed!"
      redirect_to root_url
    else
      render 'static_pages/share'
    end
  end

  private

  def share_params
    params.require(:share).permit(:url)
  end
end
