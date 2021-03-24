# README

## 概要

  プログラミング言語別にメソッドやコード、プログラミングにまつわる知識を記録し、簡単に検索できる機能を実装予定。
  EWDB（✗✗戦情報DB）を参考にarticleページでは、ページ内に検索欄を設け、非同期通信を用いて検索結果を即時にメインページに反映させる機能を実装。

  | 開発期間が短いので、以下のページ及び機能を優先して実装する |
  | ------------------------------------------------ |
  | ・トップページ                                      |
  | ・言語別ページ（article）                           |
  | ・新規投稿ページ                                    |
  | ・編集ページ                                       |
  | ・新規投稿ページにWYSIWYGエディタ(CKEditor)の実装      |
  | ・言語別検索機能                                    | 

  |追加実装機能                                   
  | --------------------------- |
  | ・ユーザー管理機能             |
  | ・メディアライブラリ機能(WP参考) |
  | ・目次機能                    |
  | ・全件検索機能                 |
  | ・Twitterリンク               |
  | ・Email送信機能               |

  他随時必要な機能が有れば記述することとする

  articleページのイメージ
  ![ Image 1](/app/assets/images/articlepage.png)

  reset.css: html5doctor.com Reset Stylesheet


## usersテーブル(将来装備機能)

| Colum              | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| nickname           | string     | null: false              |
| name               | string     | null: false              |
| email              | string     | null: false unique: true |
| encrypted_password | string     | null: false              |

### Association

  has_many :articles
  has_many :images


  ## articlesテーブル

| Colum               | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| title               | string     | null: false                   |
| text                | text       | null: false                   |
| user                | references | foreign_key: true             |
| image               | references | foreign_key: true             |

### Association

  belongs_to :user
  has_many :images


## imagesテーブル(CKEditor導入後実装)

| Colum                       | Type       | Options                       |
| --------------------------- | ---------- | ----------------------------- |
| title                       | integer    | null: false                   |
| alt                         | string     | null: false                   |
| caption                     | string     | null: false                   |
| user                        | references | null: false foreign_key: true |

### Association

belongs_to :user
belongs_to :article
has_one_attached :image