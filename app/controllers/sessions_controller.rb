class SessionsController < ApplicationController
  include SessionsHelper

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    determine_a_welcome_package(user)
    user.save!
    session[:user_id] = user.id
  end

  def destroy
    session[:user_id] = nil
    redirect_to :back, notice: "Signed out!"
  end

end
