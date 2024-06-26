require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_response :unprocessable_entity
    #レスポンスのステータスコードが422 unprocessable_entityであることを確認している。
    #ユーザー登録処理でバリデーションエラーが発生するとこのステータスコードがかえされる。
    assert_template 'users/new'
    #レンダリングされるテンプレートがusers/newであることを確認している。
    #バリデーションエラーが発生した場合、ユーザー登録画面が再度表示されるはずの為
    #assert_select 'div#'
    #assert_select 'div.'
  end

  test "valid signup information" do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:               "password",
                                         password_confirmation:  "password" }}
  end
  follow_redirect!
  assert_template 'users/show'
  assert_not flash.empty?
  assert_not flash[:danger]
  assert is_logged_in?
 end
end