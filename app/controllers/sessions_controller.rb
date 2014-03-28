class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.authenticate(params[:login], params[:password])
    if @user
      session[:id] = @user.id
      flash[:notice] = "Welcome #{@user.login}"
      redirect_to articles_path
    else
      flash[:notice] = "Login or password is not correct."
      redirect_to new_sessions_path
    end
  end
end
