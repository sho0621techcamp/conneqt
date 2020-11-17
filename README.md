# ConneQt

##　アプリケーション概要
このアプリケーションはCtoCのプログラミングを独学で学習する人に向けたエンジニアマッチング型チャットアプリケーションです。
主な機能としてはユーザーがチューターとして登録している現場で活躍している現役エンジニアに個別でチャットができます。

ユーザーがプログラミング学習で分からないことや行き詰まった内容についてチューターに質問できます。


## アプリケーションURL
[ConneQt]: http://3.112.116.203/

## テスト用ログインアカウント
ユーザー:　sho
メールアドレス:　sho@tech.com
パスワード:     sho0621 

チューター: yuta
メールアドレス: yuta@tech.com
パスワード:    sho0621


##　使い方
- ユーザーとして利用する場合

  - トップページのヘッダーに設置されている新規登録ボタンを押し、新規登録ページにて新規登録してください
  　※ 登録しない場合はテスト用のアカウントをご利用ください

  - (テスト用アカウントを利用する場合）トップページのヘッダーに設置されているログインボタンを押し、テスト用アカウントのメールアドレス、パスワードを入力し、ログインしてください。
    ※　新規登録を行った場合このステップは飛ばしてください。

  - トップページ中部に表示されているチューターの中からお好みのチューターを選択し、「詳しくみる」のボタンを押し、チューターのプロフィールページに遷移します。

  - チューターのプロフィールページの下部に設置されている「質問する」のボタンを押し、チューターとのチャットページに遷移します。

  - 任意のメッセージを入力し、エンターキーを押すとメッセージを送信できます。

  ※　チューターに送信したメッセージを確認する場合  トップページのヘッダー部分に表示されているアカウントのアイコンをクリックし、  マイページ上部にある「〇〇さんへの質問」をクリックすると、メッセージを送信したチューターとのチャットページで確認することができます。
  ※　〇〇の部分にはメッセージを送信したチューター名が入ります。

- チューターとして利用する場合
  - トップページのヘッダーに設置されているログインボタンを押し、テスト用アカウントのメールアドレス、パスワードを入力し、ログインしてください。

  - トップページのヘッダー部分にログイン中のアカウントのアイコンをクリックし、マイページに遷移します。

  - マイページ上部にある「〇〇さんからの質問」をクリックすると、メッセージを送ってきたユーザーとのチャットページに遷移し、メッセージを確認することができます。
  ※　〇〇の部分にはメッセージを送ってきたユーザー名が入ります。
  ※　ユーザーから新たにメッセージが届いている場合、「〇〇さんからの質問」の隣に「新着メッセージが届いています。」と表示されます。
  
  - ユーザーとのチャットページではユーザーが送ってきたメッセージに対してメッセージを送ることができます。


## 目指した課題解決
  ### ターゲット
  - プログラミングを独学で学習している人
  - 未経験からエンジニア転職を目指している人

  ### 課題
  - スクールやオンラインサロンに参加せず、独学で学習している人は、プログラミング学習の中で分からないことがあった時に気軽に聞ける環境がない。
  - プログラミング初学者または学習を始めたての方にとって、既存のQ&Aサイトに質問を投稿することが敷居が高く、質問しづらい。
  - 大それた考えかもしれないが、プログラミングの挫折率はおおよそ９割と言われていて、統計上、挫折者の６割は独学である状況を変えることがIT業界における人材不足の解消につながるのではないかと考えた。
  - 事実、私自身プログラミングの学習を始めた時、誰にも聞けずに挫折した実体験がある。

  ### 解決策
  - 自分自身、独学で学習していた時に、気軽に質問できる環境があれば、挫折せずに済んでいたかもしれないと考えた。
  - 私のように独学で学習し、挫折している人が大勢いるのではないかと考え、本アプリケーションの開発に至った。


## 要件定義

### ページ構成
- トップページ
- マイページ
- 新規登録ページ
- ログインページ
- チュータープロフィールページ
- チャットページ

#### トップページ
【ボタン】
・ユーザー関連
- ユーザー新規登録/ログインができるボタン
- ログイン中はログアウトできるボタン
- ユーザーの登録した画像をアイコンとして表示して、マイページへ遷移できるボタン

・チューター関連
- チューター新規登録/ログインができるボタン
- ログイン中はログアウトできるボタン
- チューターの登録した画像をアイコンとして表示して、マイページへ遷移できるボタン
- チュータープロフィールに遷移できるボタン

【表示】
- 登録しているチューターを一覧で見ることができる
  - チューターの登録した画像が表示されている
  - チューターの自己紹介の一部分が表示されている
- ログイン中は登録したユーザー名/チューター名が表示されている
- ログイン中は登録した画像をアイコンとして表示



テーブル設計

## Users テーブル

| Column                 | Type         | Options                          |
| ---------------------- | ------------ | -------------------------------- |
| nickname               | string       | null: false                      |
| email                  | string       | null: false                      |
| password               | string       | null: false                      |
| introduction           | text         | null: false                      |
| github_account         | text         |                                  |

### Association

- has_many         : room_users_tutors
- has_many         : rooms, through: :room_users_tutors
- has_many         : messages
- has_many         : tag_users
- has_many         : tags, through: :tag_users
- has_one_attached : image 



## Tutors テーブル

| Column                 | Type        | Options                          |
| ---------------------- | ----------- | -------------------------------- |
| tutor_name             | string      | null: false                      |
| email                  | string      | null: false                      |
| password               | string      | null: false                      |
| tutor_introduction     | text        | null: false                      |
| github_account         | text        |                                  |


## Association

- has_many         : room_users_tutors
- has_many         : rooms, through: room_users_tutors
- has_many         : messages
- has_many         : tags_tutors
- has_many         : tags, through: :tag_tutors
- has_one_attached : image



## room_users_tutors テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |
| tutor  | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
- belongs_to :tutor



## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users_tutors
- has_many :users, through: room_users_tutors
- has_many :tutors, through: room_users_tutors
- has_many :messages



## messages テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | text       | null: false                    |
| content      | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| tutor        | references | null: false, foreign_key: true |
| room         | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
- belongs_to :tutor



## tags テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |


### Association

- has_many : tag_users
- has_many : users, through: :tag_users
- has_many : tag_tutors
- has_many : tutors, through: :tag_tutors

## tag_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :tag



## tag_tutors テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| tutor  | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |


### Association

- belongs_to :tutor
- belongs_to :tag