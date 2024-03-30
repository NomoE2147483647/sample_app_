class ApplicationController < ActionController::Base
    include SessionsHelper
end
    #↑ApplicationControllerにSessionsHelperをincludeで読み込ませている
    #ログイン機構はあらゆる場面で使うことになるので、全コントローラの親であるApplicationControllerに読み込ませている
    #こうすることでApplicationControllerを継承している全コントローラでSessionsHelperの使用が可能になる。
    #[予備知識]Helperファイル自体は暗黙的にObjectクラスを継承しているだけで特に他のクラスを継承していない

