// メニュー操作

// トグルリスナーを追加する
function addToggleListener(selected_id, menu_id, toggle_class) {
  let selected_element = document.querySelector(`#${selected_id}`);
  selected_element.addEventListener("click", function(event) {
    event.preventDefault();
    let menu = document.querySelector(`#${menu_id}`);
    menu.classList.toggle(toggle_class);
  });
}

// クリックをリッスンするトグルリスナーを追加する
document.addEventListener("turbo:load", function() {
  addToggleListener("hamburger", "navbar-menu",   "collapse");
  addToggleListener("account",   "dropdown-menu", "active");
});

// トグルリスナーを追加してクリックをリッスンする
//document.addEventListener("turbo:load", function() {
//  let hamburger = document.querySelector("#hamburger");
//  hamburger.addEventListener("click", function(event) {
//    event.preventDefault();
//    let menu = document.querySelector("#navbar-menu");
//    menu.classList.toggle("collapse");
//  });
//  let account = document.querySelector("#account");
//  account.addEventListener("click", function(event) {
//    event.preventDefault();
//    let menu = document.querySelector("#dropdown-menu");
//    menu.classList.toggle("active");
//  });
//});

//上記のコードは、ターボフレームワークによるページ遷移後、アカウント要素をクリックすると、
//ドロップダウンメニューの表示/非表示を切り替える機能を実装しています。

//全要素詳細解説
//1. document.addEventListener("turbo:load", function() {:
//
//1.1. document:
//     種類: オブジェクト
//     役割: HTMLドキュメント全体を表す
//     説明:
//     HTMLドキュメント全体へのアクセスを提供します。
//     要素の取得、スタイルの変更、イベント処理など、さまざまな操作に使用できます。

//1.2. addEventListener:
//     種類: メソッド
//     役割: イベントリスナーを追加する
//     説明:
//     指定されたイベントが発生したときに実行される関数を登録します。
//     イベントの種類、処理する関数、オプション設定などを指定できます。

//1.3. "turbo:load":
//     種類: 文字列
//     役割: イベント名
//     説明:
//     Turboフレームワークがページの読み込みを完了したときに発生するイベントです。
//     ページ読み込み後の処理を実行するために使用されます。

//1.4. function() {:
//     種類: 匿名関数
//     役割: イベント処理を行う関数
//     説明:
//     addEventListener メソッドで指定されたイベントが発生したときに実行されます。
//     具体的な処理内容は、関数内に記述します。

//2. let account = document.querySelector("#account");:
//2.1. let:
//     種類: キーワード
//     役割: 変数を宣言する
//     説明:
//     変数を宣言し、初期値を設定するために使用されます。
//     let で宣言された変数は、ブロックスコープを持ちます。

//2.2. account:
//     種類: 変数
//     役割: #account 要素への参照を保存
//     説明:
//     querySelector メソッドで取得した #account 要素への参照を保存します。
//     後続の処理で、この変数を使用して #account 要素を操作できます。

//2.3. querySelector:
//     種類: メソッド
//     役割: 最初のマッチする要素を取得
//     説明:
//     指定されたセレクターに一致する最初の要素を取得します。
//     ID、クラス名、要素名など、さまざまなセレクターを使用できます。

//2.4. "#account":
//     種類: 文字列
//     役割: IDセレクター
//     説明:
//     id="account" 属性を持つ要素を選択します。
//     ページ内に複数の要素が存在しても、IDはユニークであるため、必ず1つの要素が選択されます。

//3. account.addEventListener("click", function(event) {:
//3.1. addEventListener:
//     種類: メソッド
//     役割: イベントリスナーを追加する
//     説明:
//     account 変数に関連付けられた要素にイベントリスナーを追加します。
//     イベントの種類、処理する関数、オプション設定などを指定できます。

//3.2. "click":
//     種類: 文字列
//     役割: イベント名
//     説明:
//     account 要素がクリックされたときに発生するイベントです。
//     クリック時の処理を実行するために使用されます。

//3.3. function(event) {:
//     種類: 匿名関数
//     役割: イベント処理を行う関数
//     説明:
//     account 要素がクリックされたときに実行されます。
//     イベントオブジェクトを受け取り、イベント情報を取得できます。

//3.4. event:
//     種類: イベントオブジェクト
//     役割: イベント情報を受け取る
//     説明:
//     イベントの種類、発生した要素、マウス座標などの情報を提供します。
//     イベント処理に必要な情報を取得するために使用されます。

//4. event.preventDefault();:
//4.1. preventDefault:
//     種類: メソッド
//     役割: イベントのデフォルト動作をキャンセル
//     説明:
//     イベントのデフォルト動作をキャンセルします。
//     例えば、リンクのクリックによるページ遷移をキャンセルできます。

//5. let menu = document.querySelector("#dropdown-menu");:
//5.1. let:
//     種類: キーワード
//     役割: 変数を宣言する
//     説明:
//     変数を宣言し、初期値を設定するために使用されます。
//     let で宣言された変数は、ブロックスコープを持ちます。

//5.2. menu:
//     種類: 変数
//     役割: #dropdown-menu 要素への参照を保存
//     説明:
//     querySelector メソッドで取得した #dropdown-menu 要素への参照を保存します。
//     後続の処理で、この変数を使用して #dropdown-menu 要素を操作できます。

//5.3. querySelector:
//     種類: メソッド
//     役割: 最初のマッチする要素を取得
//     説明:
//     指定されたセレクターに一致する最初の要素を取得します。
//     ID、クラス名、要素名など、さまざまなセレクターを使用できます。

//5.4. "#dropdown-menu":
//     種類: 文字列
//     役割: IDセレクター
//     説明:
//     id="dropdown-menu" 属性を持つ要素を選択します。
//     ページ内に複数の要素が存在しても、IDはユニークであるため、必ず1つの要素が選択されます。

//6. menu.classList.toggle("active");:
//6.1. classList:
//     種類: プロパティ
//     役割: 要素のクラスリストを取得
//     説明:
//     要素のクラスリストを取得します。
//     クラスの追加、削除、変更などの操作に使用できます。

//6.2. toggle:
//     種類: メソッド
//     役割: クラスの追加または削除
//     説明:
//     指定されたクラスが要素のクラスリストに存在する場合は削除し、存在しない場合は追加します。

//6.3. "active":
//     種類: 文字列
//     役割: クラス名
//     説明:
//     active クラスは、ドロップダウンメニューが表示されているかどうかを示すクラスです。
//     このクラスの追加または削除によって、ドロップダウンメニューの表示状態を切り替えます。