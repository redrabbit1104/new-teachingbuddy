# アプリ名

教育現場で活躍するスケジュール管理・業務連絡ソフト「TeachingBuddy」

# 概要

スケジュール管理者はカレンダーに科目名・日付・時間などを記載し登録できます。ユーザーは管理者が登録したシフトにエントリーすることによって勤務スケジュールの予定を入れることができます。エントリーされたスケジュールは管理者が承認をし確定されたスケジュールはスケジュール一覧から閲覧できます。また、ユーザー間はチャットツールを利用し、シフトや勤務に関する連絡などをすることができます。出張や外出など日々起こり得る業務連絡は掲示板ツールを利用して予定を共有することができます。ユーザー登録は名前・メールアドレス・暗証番号に加え、画像（アバター）の登録を行い、登録した画像はトップページのサイドバーに表示されます。

# 本番環境

公開中のサイト  
<a href="http://54.248.212.236/" target="blank" style="text-decoration: none;">http://54.248.212.236/</a>

テスト用のアカウント

- 管理者用のアカウント  
  メールアドレス：test1@abc.com  
  パスワード：111111

- ユーザー用のアカウント  
  メールアドレス：1111@abc.com  
  パスワード：1111111

# 制作背景

日本語学校などの教育現場において非常勤教師のシフト管理や連絡は頻繁に行われており、勤務管理をする管理者の業務負担が増えていることが分かりました。主に非常勤教師のシフトはメールで申し込まれており、それらを纏めて管理するのは時間と手間が掛かる大変な作業です。教育現場に働く非常勤教師の事情は様々であり、予期せぬことが起きた場合の対応（急なシフト変更、欠勤など）が求められたり、お互いのコミュニケーション不足でトラブルが起きたりする場合もあります。このような状況を踏まえ、非常勤教師のスケジュール管理を効率的に行うと共にコミュニケーションが円滑に取れるように工夫しスケジュール管理・コミュニケーションツールとしてのアプリを制作しました。

# Demonstration

- トップページ（ログイン前）  
  ![トップページ-1](http://jintomo.sakura.ne.jp/MD/top.png)  
  画面の左側にはログイン・ログアウト機能の他、MENU ボタンから他のページに遷移することができます。また、画面中央側には掲示板が表示されるようになっており、その日の予定を共有することができます。

- トップページ（ユーザーログイン時)  
  ![トップページ２](http://jintomo.sakura.ne.jp/MD/top-1.png)
  ユーザーでログインしたら、画面左側に登録したユーザーのアバターが表示されるようになります。「Sign in」のところにはユーザー登録したユーザーの画像とニックネームが表示されます。

- トップページ（管理者ログイン時)  
  ![トップページ３](http://jintomo.sakura.ne.jp/MD/top-2.png)  
  ⚫️ のボタンをクリックし、🔴 になった状態で管理者でログインできます。管理者はアバター画像の代わりに「Admin」という文字が表示されます。

- スケジュール管理画面（スケジュール登録）
  ![スケジュール1](http://jintomo.sakura.ne.jp/MD/schedule-1.png)
  授業新規登録画面。管理者でログインしたらカレンダー上に授業のスケジュールを登録できます。科目・日付・時間などを入力し「submit」ボタンをクリックすると、登録した日付にスケジュールが表示されます。

- スケジュール管理画面（エントリー）
  ![スケジュール2](http://jintomo.sakura.ne.jp/MD/schedule-2.png)
  スケジュールエントリ画面。ユーザーはカレンダー上に管理者によって登録されたスケジュールをクリックし、授業にエントリーすることができます。

- スケジュール管理画面（授業承認）
  ![スケジュール3](http://jintomo.sakura.ne.jp/MD/schedule-3.png)
  スケジュール承認画面。管理者はユーザーがエントリーしたスケジュールをチェックし承認することができます。エントリーしたユーザーが複数人いる場合、承認するユーザーを選びチェックを入れることで授業の担当者が決まります。

- 掲示板画面
  ![掲示板](http://jintomo.sakura.ne.jp/MD/bul-1.png)
  ユーザーは掲示板に外出や出張などの予定を入力し知らせることができます。

- チャットルーム生成画面
  ![チャットルーム](http://jintomo.sakura.ne.jp/MD/chat-1.png)
  ユーザーのアバターをクリックすると新たなチャットルームの生成画面を生成することができます。

- チャット画面
  ![チャット](http://jintomo.sakura.ne.jp/MD/chat-2.png)
  チャットルームではテキストや画像などのメッセージを送ることができます。この機能でユーザー同志で直接連絡を取れるようになります。

- ユーザー新規登録画面
  ![ユーザー登録](http://jintomo.sakura.ne.jp/MD/regi.png)
  チャットルームではテキストや画像などのメッセージを送ることができます。この機能でユーザー同志で直接連絡を取れるようになります。

# 工夫したポイント

- ユーザーと管理者という２つの役割に応じてログインできるようにしました。
- ボタン一つでユーザーと管理者のログイン画面に切り替えられるようにしました。
- 月別のスケジュールが一覧で見れるようにカレンダーを作り、ビュー画面にしました。
- テーブルの設計においてアソシエーションを明確にし、必要なデータを画面に表示させたりデータベースに正しく保存できるようにしました。
- 条件分岐やループなどを利用し、必要なデータを取り出せるようにしました。

## 使用言語&技術

- Ruby、Ruby on Rails、 Javascript、 Html、 CSS、 SASS

## データベース

- Mysql2

## デプロイ

- heroku

## その他

- AWS S3

## エディター

- VSCode

# 今後の課題&追加で実装したい機能について

- 定期的に機能のチェックを行い、その都度 Debug&補修・点検をする
- コードのリファクタリングを行い、管理しやすいコードにする
- チャット機能において、メッセージ投稿後自動的にリロードするように実装する
- スケジュールの印刷機能を追加
- チャットルームのメッセージ検索機能を追加
- SNS 認証によるログイン機能の追加

# テーブル設計

![TeachingBuddyのER図](http://jintomo.sakura.ne.jp/MD/ER.jpeg)

## rooms テーブル

| Column    | Type    | Option |
| :-------- | :------ | :----- |
| target_id | integer |        |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## adminrooms テーブル

| Column | Type       | Option            |
| :----- | :--------- | :---------------- |
| user   | references | foreign_key: true |
| admin  | references | foreign_key: true |

### Association

- has_many :admin_messages
- belongs_to :user
- belongs_to :admin

## messages テーブル

| Column  | Type       | Option            |
| :------ | :--------- | :---------------- |
| content | string     |                   |
| user    | references | foreign_key: true |
| admin   | references | foreign_key: true |

### Association

- has_many :admin_messages
- belongs_to :user
- belongs_to :admin

## roomusers テーブル

| Column | Type       | Option            |
| :----- | :--------- | :---------------- |
| user   | references | foreign_key: true |
| room   | references | foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## adminmessages テーブル

| Column    | Type       | Options           |
| :-------- | :--------- | :---------------- |
| context   | string     |                   |
| flag      | integer    |                   |
| user      | references | foreign_key: true |
| admin     | references | foreign_key: true |
| adminroom | references | foreign_key: true |

### Association

- belongs_to :admin_room
- belongs_to :admin
- belongs_to :user

## users テーブル

| Column             | Type   | Options                 |
| :----------------- | :----- | :---------------------- |
| user_name          | string | null: false             |
| encrypted_password | string | null: false             |
| email              | string | null: false,unique:true |
| last_name          | string | null: false             |
| first_name         | string | null: false             |

### Association

- has_many :room_users
- has_many :rooms
- has_many :schedules, through: room_users
- has_one :admin_room
- has_many :admin_messages
- has_many :messages
- has_many :boards
- has_many :checks
- has_one :confirm

## admins テーブル

| Column             | Type   | Options                 |
| :----------------- | :----- | :---------------------- |
| admin_name         | string | null: false             |
| encrypted_password | string | null: false             |
| admin_email        | string | null: false,unique:true |
| admin_last_name    | string | null: false             |
| admin_first_name   | string | null: false             |

### Association

- has_many :admin_rooms
- has_many :admin_messages
- has_many :confirms

## boards テーブル

| Column | Type       | Option            |
| :----- | :--------- | :---------------- |
| post   | text       |                   |
| user   | references | foreign_key: true |

### Association

- belongs_to :user

## checks テーブル

| Column | Type       | Option            |
| :----- | :--------- | :---------------- |
| check  | boolean    |                   |
| user   | references | foreign_key: true |

### Association

- belongs_to :schedule
- belongs_to :user

## schedules テーブル

| Column     | Type       | Options           |
| :--------- | :--------- | :---------------- |
| subject    | string     | null: false       |
| start_time | time       | null: false       |
| end_time   | time       | null: false       |
| sdate      | references | foreign_key: true |

### Association

- has_many :checks
- belongs_to :sdate
- has_one :confirm

## confirms テーブル

| Column   | Type       | Options           |
| :------- | :--------- | :---------------- |
| check    | boolean    |                   |
| user     | references | foreign_key: true |
| admin    | references | foreign_key: true |
| schedule | references | foreign_key: true |

### Association

- has_one :user
- belongs_to :admin
- belongs_to :schedule

## sdates テーブル

| Column | Type | Options     |
| :----- | :--- | :---------- |
| sdate  | date | null: false |

### Association

- has_many :schedules
