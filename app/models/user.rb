class User < ApplicationRecord
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
