ENV["RAILS_ENV"] ||= "test"
#||=は、左辺の式がnilの場合、右辺の式を評価して代入、nilでない場合はそのまま何もしない。
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # 指定のワーカー数でテストを並列実行する
  parallelize(workers: :number_of_processors)

  # test/fixtures/*.ymlにあるすべてのfixtureをセットアップする
  fixtures :all
  include ApplicationHelper
  # （すべてのテストで使うその他のヘルパーメソッドは省略）

  #テストユーザーがログイン中の場合にtrueを返す
  def is_logged_in?
    !session[:user_id].nil?
  end
end
