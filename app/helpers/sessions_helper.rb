module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
    session[:session_token] = user.session_token
  end

  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # 記憶トークンcookieに対応するユーザーを返す
  def current_user
    if (user_id = session[:user_id])
      user = User.find_by(id: user_id)
      if user && session[:session_token] == user.session_token
        @current_user = user
      end
    elsif (user_id = cookies.encrypted[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  #ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
  #永続的セッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
 
  #現在のユーザーをログアウトする
  def log_out
    forget(current_user)
    reset_session
    @current_user = nil #安全のため
  end
end


#store メソッドを呼び出していなくても、session[:user_id] に値を代入すると、
#その値はデフォルトで一時クッキーとしてブラウザに保存されます。これは、Rails のセッション管理機能によるものです。
#1.セッション管理機能
# Rails は、session オブジェクトというハッシュを使用して、ユーザーセッション情報を管理します。このハッシュには、
# ユーザーID、ログイン状態など、セッションに関する情報が保存されます。
#2. セッション情報の保存
# session オブジェクトに値を代入すると、その値は自動的にブラウザに送信されます。ブラウザは、この値をクッキーとして保存します。
#3. 一時クッキー
# session オブジェクトに保存された情報は、デフォルトで一時クッキーとして保存されます。一時クッキーは、ブラウザを閉じると
# 消去されます。
#4. store メソッド
# store メソッドは、セッション情報を明示的に保存するために使用されます。このメソッドを呼び出すと、session オブジェクトに
# 保存された情報がブラウザに送信されます。
#5. まとめ
# session オブジェクトに値を代入すると、その値は自動的にブラウザに送信され、一時クッキーとして保存されます。
# store メソッドは、セッション情報を明示的に保存するために使用されます。
#6. 補足
#
#session オブジェクトは、session という名前のヘルパーメソッドを通してアクセスできます。
#store メソッドは、オプションを受け取ることができます。詳細はRailsガイドを参照してください。
#永続cookieに保存するにはparmanentメソッドを使う