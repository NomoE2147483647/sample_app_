class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session  #ログインの直前に必ずこれを書くこと。セッション固定攻撃への対策になる。
      log_in user
      redirect_to user
      #user_url(user)のプロフィールページへの変換
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
  end
end
