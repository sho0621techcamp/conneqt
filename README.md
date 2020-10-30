# README
テーブル設計

## Users テーブル

| Column                 | Type         | Options                          |
| ---------------------- | ------------ | -------------------------------- |
| nickname               | string       | null: false                      |
| email                  | string       | null: false                      |
| password               | string       | null: false                      |
| introduction           | text         | null: false                      |
| github_account         | text         |                                  |
| lang_tag               | references   | null: false, foreign_key: true   |

### Association

- has_many : room_users_tutors
- has_many : rooms, through: room_users_tutors
- has_many : messages
- has_many : lang_tags



## Tutors テーブル

| Column                 | Type        | Options                          |
| ---------------------- | ----------- | -------------------------------- |
| tutor_name             | string      | null: false                      |
| email                  | string      | null: false                      |
| password               | string      | null: false                      |
| tutor_introduction     | text        | null: false                      |
| github_account         | text        |                                  |
| lang_tag               | references  | null: false, foreign_key: true   |

## Association

- has_many : room_users_tutors
- has_many : rooms, through: room_users_tutors
- has_many : messages
- has_many : lang_tags



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
| issue_title  | text       | null: false                    |
| issue_text   | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| tutor        | references | null: false, foreign_key: true |
| room         | references | null: false, foreign_key: true |
| lang_tag     | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
- belongs_to :tutor
- belongs_to :lang_tag



## lang_tag テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| tag          | integer    | null: false                    |
| star         | integer    | null: false                    |
| user         | references |              foreign_key: true |
| tutor        | references |              foreign_key: true |
| message      | references | null: false, foreign_key: true |

### Association

- has_many : users
- has_many : tutors
- has_many : messages
