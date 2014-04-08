class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # @user = User.where("email" => params[:email])

    if @user = login(params[:username], params[:password])
      redirect_back_or_to(:root, :notice => "Login Successful")
    else
      flash.now[:alert] = "Login Failed, Invalid"; render :action => "new"
    end 
  end

  def destroy
    logout
    redirect_to(:root, :notice => 'Bye')
  end

end
