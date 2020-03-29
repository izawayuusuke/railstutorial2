module SessionsHelper

  def log_in(user) # 渡されたユーザーでログインする
    session[:user_id] = user.id
  end

  def current_user # 現在のログイン中のユーザーを返す（いる場合）
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in? # ユーザーがログインしていればtrue、その他ならfalseを返す
    !current_user.nil?
  end

  def log_out # 現在のユーザーをログアウトする
    session.delete(:user_id)
    @current_user = nil
  end
end
