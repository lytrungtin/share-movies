class StaticPagesController < ApplicationController
  def home
    @shares = Share.paginate(page: params[:page])
  end

  def share
    @share = current_user.shares.build if logged_in?
  end
end
