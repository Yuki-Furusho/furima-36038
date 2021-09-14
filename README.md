# README
## users
|Column             |Type   |Options                    |
|---                |---    |---                        |
|nickname           |string |null: false                |
|email              |string |null: false, unique: true  |
|encrypted_password |string |null: false                |
|first_name         |string |null: false                |
|last_name          |string |null: false                |
|first_nama_kana    |string |null: false                |
|last_nama_kana     |string |null: false                |
|birth              |date   |null: false                |

### Association
- has_many :items
- has_many :orders


## items
|Column           |Type       |Options                        |
|---              |---        |---                            |
|name             |string     |null: false                    |
|detail           |text       |null: false                    |
|category_id      |integer    |null: false                    |
|condition_id     |integer    |null: false                    |
|delivery_fee_id  |integer    |null: false                    |
|prov_id          |integer    |null: false                    |
|ship_days_id     |integer    |null: false                    |
|price            |integer    |null: false                    |
|user             |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders
|Column |Type       |Options                        |
|---    |---        |---                            |
|item   |references |null: false, foreign_key: true |
|user   |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses
|Column     |Type       |Options                        |
|---        |---        |---                            |
|postal_code|string     |null: false                    |
|prov_id    |integer    |null: false                    |
|city       |string     |null: false                    |
|address    |string     |null: false                    |
|building   |string     |---                            |
|phone      |string     |null: false                    |
|order      |references |null: false, foreign_key: true |

### Association
- belongs_to :order
