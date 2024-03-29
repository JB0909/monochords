# 概要
「MONOCHORD」はギタリストの練習した曲の記録や、練習量を管理し、
日本中のギタリストと練習曲や練習方法を通じてコミュニケーションができる
ソーシャルネットワーキングサービスです。


# URL
~~https://monochords.jp/~~

~~【ゲストログイン(閲覧用)】ボタンからテストユーザーとしてログインできます。~~

現在は公開しておりません。


# 機能一覧
**monochordsの投稿機能**
* 投稿機能(ajax)
* 練習曲・練習時間を記録する練習投稿機能(ajax)
* 楽曲レビュー投稿機能(ajax)
* 各投稿へのいいね機能(ajax)
* 各投稿へのコメント機能(ajax)
* 自身の各投稿削除機能(ajax)

**ユーザー管理機能**
* ユーザー情報の登録(devise)
* ユーザー情報の編集(公開/非公開機能)
* ユーザープロフィール画像機能(refile/refile-mini_magick)
* ユーザー同士のフォロー・フォロワー機能
* フォローしているユーザーの全ての投稿一覧機能
* 練習投稿記録から総練習時間を計測
* 練習したい・練習中・練習した曲のリスト機能
* 練習した曲リストから練習したアーティストの比率をグラフ表示(Google Chart)

**検索機能**
* 楽曲検索機能(SpotifyAPI使用)
* 楽曲詳細ページが未登録時、クリック毎にデータベースへ登録

**その他の機能**
* ページネーション機能(kaminari)による無限スクロール
* SSL証明書(AWS Certificate Manager)
* レスポンシブ対応(モバイルファースト)

# 使用方法
**ゲストログイン**</br>
「ゲストログイン(閲覧用)」にてフォーム入力せずログインできます。

**つぶやき投稿**</br>
1.「ゲストログイン(閲覧用)」よりログインします。</br>
2.「つぶやく」ボタンをクリックするとモーダルが表示されます。</br>
3.文章入力後、モーダルの「つぶやく」ボタンをクリックすると投稿が完了します。

**練習記録投稿**</br>
1.「練習記録」ボタンをクリックするとモーダルが表示されます。</br>
2.練習した内容をフォームに入力し、練習した曲名と時間をプルダウンメニューから選択します。</br>
※曲名のプルダウンメニューは「練習中の曲」リストから選択されます。</br>
3.モーダルの「練習投稿」ボタンをクリックすると投稿が完了します。</br>
4.ホーム画面の「練習記録」タブをクリックすると投稿内容を確認することができます。

**レビュー投稿**</br>
1.ヘッダーの検索フォームより、曲名を入力し検索します。</br>
2.検索結果より、楽曲を選択し、詳細ページへ移動します。</br>
3.詳細ページの「レビュー・感想を投稿する」と表示されたフォームをクリックすると、レビューを入力することができます。</br>
4.入力後、「投稿する」ボタンをクリックすると投稿が完了します。</br>
※レビューは楽曲詳細ページと、ホーム画面「レビュー」タブの両方に表示されます。

**練習リストへ登録**</br>
1.ヘッダーの検索フォームより、曲名を入力し検索します。</br>
2.検索結果より、楽曲を選択し、詳細ページへ移動します。</br>
3.「楽曲の登録」覧より、練習したい曲/練習中の曲/練習した曲を選び、クリックするとリストに登録されます。</br>
4.ホーム画面/マイページにて「練習データ」覧に楽曲数が増えていることを確認することができます。</br>
5.「練習データ」覧のいずれかをクリックするとリストの詳細ページが表示されます。</br>
※リスト詳細ページより、「練習したい曲」から「練習中の曲」へ変更することができます。

**アーティストグラフ**</br>
1.「練習した曲」リストのアーティスト名に基づいて、マイページにアーティストグラフが生成されます。</br>
2.アーティストグラフは、上位10名を表示しており、割合と曲数を円グラフで表示しています。

# 環境・使用技術
**フロントエンド**
*  HTML
*  SCSS
*  Javascript, jQuery, Ajax
*  Bootstrap 4.5.0

**バックエンド**
*  Ruby 2.7.1
*  Ruby on Rails 6.1.3.2

**開発環境**
* MySQL2
* Docker/docker-compose

**本番環境**
* AWS(ELB,EC2,RDS for MySQL,Route53,VPC)
* Nginx
* Puma
* CircleCI CD機能を率いてdocker-composeよりコンテナを構築し、自動デプロイ
* MySQL2

**テスト**
* Rspec
* CircleCI CI機能を率いてdocker-composeよりコンテナを構築し、自動テスト(Rspec)

**その他使用技術**
* チーム開発を意識したGitHubの活用 （イシュー、プルリク、マージ)
* deviseとAction Mailerを使用して自動メール送信

**インフラ構築図**

・マルチAZ構成により冗長化を行い、可用性を向上させております。</br>
・ELBにより負荷分散を行っております。
![インフラ構築図](https://user-images.githubusercontent.com/53462797/122939658-c783b580-d3ae-11eb-906b-53b7af8db31a.jpg)




# ER図

![ER図](https://user-images.githubusercontent.com/53462797/121474289-d6598800-c9fe-11eb-8ddc-a8584aa0701d.jpg)

