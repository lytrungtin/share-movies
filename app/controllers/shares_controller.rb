class SharesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @share = current_user.shares.build(share_params)
    if @share.save
      flash[:success] = "Share created!"
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
