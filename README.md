# 概要
「MONOCHORD」はギタリストの練習した曲を記録して、練習量を管理したり、
日本中のギタリストと練習曲を通じてコミュニケーションができる
ソーシャルネットワーキングサービスです。


# URL
https://monochords.jp/

【ゲストログイン(閲覧用)】ボタンからテストユーザーとしてログインできます。

# 制作の背景

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
* ページネーション機能(kaminari)
* HTTPS通信(AWS Certificate Manager)
* レスポンシブ対応(スマートフォンファースト)

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
* AWS(ALB,EC2,RDS for MySQL,Route53,VPC)
* Nginx
* Puma
* CircleCI CD機能を率いてdocker-composeよりコンテナを構築し、自動デプロイ
* MySQL5.7

**テスト**
* Rspec
* CircleCI CI機能を率いてdocker-composeよりコンテナを構築し、自動テスト(Rspec)

**その他使用技術**
* チーム開発を意識したGitHubの活用 （イシュー、プルリク、マージ)
* deviseとAction Mailerを使用して自動メール送信

# ER図
