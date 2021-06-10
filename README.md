# 概要
「MONOCHORD」はギタリストの練習した曲を記録して、練習量を管理したり、
日本中のギタリストと練習曲を通じてコミュニケーションができる
ソーシャルネットワーキングサービスです。


# URL
https://monochords.jp/

【ゲストログイン(閲覧用)】ボタンからテストユーザーとしてログインできます。

# 制作の背景
ギターは私の一番の趣味です。
中学生の頃にギターと出会い、今も趣味としてギター演奏を続けております。

当時私は、独学でギターを練習していたため、好きなアーティストだけをひたすらに練習するといったものでした。

自分でもギターが上達したなと感じていた頃、私は同世代のギタリストと出会い驚愕しました。
なぜなら、ギター歴も自分とほとんど同じであるにも関わらず、技術やセンス等が突出していたからです。
自分には才能が無いのではないか？ 自分とは何が違うのか？等、途方に暮れましたが、
そのギタリストを研究することで自分なりに見つけた答えが「練習内容」でした。

好きなアーティストだけをひたすらに練習する自分とは、圧倒的に練習曲や練習方法に対する知見が違いました。
練習する曲や、その曲の練習方法等を真似することで自分でも上達していることを実感できました。
また、様々な練習曲等の知見が広がっていくことで、初対面で出会った演奏者と演奏する際に使用される定番曲の存在等も知ることができました。
これらの知識は、演奏者として音楽をより豊かにするものと感じています。

このような体験から、様々なギタリストの練習の記録を参考にすることで、自身の演奏者としての知見を広げるだけではなく、
自身の練習を記録に残し、どのようなジャンルの、どのようなアーティストを、どれくらい練習したか？等の記録を重ねていくことで
練習へのモチベーションも向上すると感じ「MONOCHORDS」というサービスを開発しました。

MONOCHORDとは1本の弦を張り、その振動を利用して音程を計測し、音律を規定する楽器です。
音律を規定していく様が、練習により上達していく様と重なったため、「MONOCHORDS」というサービス名にしました。

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
* MySQL2

**テスト**
* Rspec
* CircleCI CI機能を率いてdocker-composeよりコンテナを構築し、自動テスト(Rspec)

**その他使用技術**
* チーム開発を意識したGitHubの活用 （イシュー、プルリク、マージ)
* deviseとAction Mailerを使用して自動メール送信

**インフラ構築図**

![インフラ構築図](https://user-images.githubusercontent.com/53462797/121338856-e323a080-c958-11eb-8d10-5f2676a5ba19.jpg)



# ER図

![ER図](https://user-images.githubusercontent.com/53462797/121474289-d6598800-c9fe-11eb-8ddc-a8584aa0701d.jpg)

