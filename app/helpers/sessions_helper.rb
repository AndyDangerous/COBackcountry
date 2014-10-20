module SessionsHelper

  def determine_a_welcome_package(user)
    if already_exists?(user)
      redirect_to :back, notice: "Signed in!"
    else
      send_them_a_welcome_email(user)
      redirect_to root_path, notice: "Signed in!"
    end
  end

  def already_exists?(user)
    User.find_by_uid_and_provider(user.uid, user.provider)
  end

  def send_them_a_welcome_email(user)
    UserNotifier.send_signup_email(user).deliver
  end
end
