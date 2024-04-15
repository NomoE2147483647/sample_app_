class User < ApplicationRecord
  attr_accessor :remember_token
  #attr_accessorメソッドを使って、仮想属性:remember_tokenを作成
  #attr_accessorメソッドはデータベースに保存される通常の属性へのアクセス、上記のような仮想属性の作成とアクセスができる
  before_save { self.email = email.downcase }
  #↑Userモデルの中では右辺のselfを省略出来る(左辺は不可)
  #before_save { self.email = self.email.downcase }
  #before_save { email.downcase!}
  validates :name,  presence: true, length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A(?!\+)(?!\-)[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #ランダムなトークンを返す
  def User.new_token
    SecureRandom.urlsafe_base64
    #Rubyの標準ライブラリSecureRandomにあるurlsafe_base64メソッドを実行。A–Z、a–z、0–9、"-"、"_"のいずれかの文字（26×2+10+1+1=64種類）からなる長さ22のランダムな文字列を返す。
  end

  #永続的セッションのためにユーザーをデータベースに記憶する
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #渡されたトークンがダイジェストと一致したらtrueを返す
  def authenticated?(remember_token)
    #※attr_accessorで定義したアクセッサーではなくローカル変数

    return false if remember_digest.nil?
    #returnキーワードを使う事で、記憶ダイジェストがnilの場合には即座にメソッドを終了している。早期脱出というテクニック。

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
    #これはBCrypt::Password.new(remember_digest)というremember_digestを受け取ってできたBcryptオブジェクトと、is_password?メソッドはBcryptで引数のremember_tokenのハッシュ化を行う。
    #Bcryptオブジェクトにすることによってハッシュ化する時のsalt（ランダム値）を取り出して、　remember_tokenのハッシュ化にも適用させれるのでそれによって一致を確認できる。
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end

  #バリデーションメソッドに対して複数のバリデーションオプションを設定出来る。
  #presence 存在チェック
  #length: 長さチェック
  #format:フォーマット検証
  #numericality: 数値であること
  #inclusion: 指定された値のいずれかであること
  #format: 正規表現に一致すること
  #uniqueness: 一意であることを検証。デフォルトだと大文字と小文字を区別している
  ##case_sensitive: falseだと、大文字と小文字を区別しなくなる。
  #また、lengthオプションにはmaximum以外にも
  ##is: 値が特定の値であることをバリデーションします。
  ##in: 値が特定の値のリストに含まれていることをバリデーションします。
  ##within: 値が特定の範囲内にあることをバリデーションします。

  #Railsのコールバックメソッドは、モデルのライフサイクルにおける特定のタイミングで実行されるメソッドです。
  #モデルのオブジェクト作成、更新、削除、保存など、さまざまなイベントにフックして、独自の処理を実行することが
  #できます。
  #主なコールバックメソッド
  #- **before_validation:** バリデーションを行う前に実行されます。
  #- **after_validation:** バリデーションを行った後に実行されます。
  #- **before_save:** 保存前に実行されます。
  #- **after_save:** 保存後に実行されます。
  #- **before_create:** 作成前に実行されます。
  #- **after_create:** 作成後に実行されます。
  #- **before_update:** 更新前に実行されます。
  #- **after_update:** 更新後に実行されます。
  #- **before_destroy:** 削除前に実行されます。
  #- **after_destroy:** 削除後に実行されます。
