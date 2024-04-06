# Pin npm packages by running ./bin/importmap
#↑npm packagesとはJavaScript開発で利用できるコードやライブラリをまとめたもの。Node.jsモジュールとも。

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/custom",      under: "custom"

#pinメソッド: 特定のバージョンのモジュールをピン留めするために使用されます。
#pin_all_fromメソッド: 特定のディレクトリ内のすべてのモジュールをピン留めするために使用されます。
#pin_all_from_gemsメソッド: 特定のGemfileで指定されたすべてのモジュールをピン留めするために使用されます。
#pin_all_from_node_modulesメソッド: node_modulesディレクトリ内のすべてのモジュールをピン留めするために使用されます。
#pin_all_from_yarn_modulesメソッド: yarn.lockファイルで指定されたすべてのモジュールをピン留めするために使用されます。
#ピン留めとは以下の意味を持ちます。
#1. 特定のパッケージの最新バージョンを指定する
#   バージョンが明記されていない場合、ピン留めは最新バージョンのパッケージを指定します。例えば、pin "application" は、package.json ファイルに
#   記載されている application パッケージの最新バージョンをピン留めします。
#2. 依存関係を解決する
#   ピン留めは、importmap.rb ファイル内でモジュールの依存関係を解決するために使用されます。例えば、pin "@hotwired/turbo-rails", 
#   to: "turbo.min.js" は、@hotwired/turbo-rails モジュールが turbo.min.js ファイルに存在することを示します。
#3. プリロードを指定する
#   preload オプションは、指定されたモジュールをブラウザが最初に読み込むように指示します。これは、アプリケーションの起動時間を短縮するために役立ちます。例えば、pin "application", preload: true は、application パッケージをブラウザが最初に読み込むように指示します。
#4. ディレクトリ内のすべてのモジュールをピン留めする
#   pin_all_from メソッドは、特定のディレクトリ内のすべてのモジュールをピン留めするために使用されます。例えば、
#   pin_all_from "app/javascript/controllers",under: "controllers" は、app/javascript/controllers ディレクトリ内の
#   すべてのモジュールを controllers という名前空間でピン留めします。

