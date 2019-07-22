class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
    elsif @user
      flash[:danger] = 'Invalid email/password combination'
    else
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "Welcome to FUNNY MOVIES!"
      else
        flash[:danger] ||= []
        @user.errors.full_messages.each do |msg|
          flash[:danger] << msg
        end
      end
    end
    redirect_to root_url
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private

    def user_params
      params.require(:session).permit(:email, :password)
    end
end
