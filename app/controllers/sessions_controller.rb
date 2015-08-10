class SessionsController < ApplicationController
  
  def create
    user = User.find_by(name: params[:name])
    if user = user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_sunjust_products_path, notice: "哈囉鑫林! #{user.name}"
    else
      redirect_to dashboard_sunjust_sign_in_path, notice: "登入失敗"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: "辛苦了，再見"
  end
end
