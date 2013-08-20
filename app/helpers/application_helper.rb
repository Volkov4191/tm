module ApplicationHelper

  def auth user
    session[:user_id] = user.id
  end

  def is_auth?
    session[:user_id].present?
  end

end
