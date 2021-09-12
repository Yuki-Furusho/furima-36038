# README
## users
|Column             |Type   |Options                    |
|---                |---    |---                        |
|nickname           |string |null: false                |
|email              |string |null: false, unique: true  |
|encrypted_password |string |null: false                |
|name               |string |null: false                |
|nama_kana          |string |null: false                |
|birth              |integer|null: false                |

### Association
- has_many :items
- has_many :orders
- has_many :shipping_addresses

## items
|Column       |Type       |Options                        |
|---          |---        |---                            |
|name         |string     |null: false                    |
|image        |string     |null: false                    |
|detail       |text       |null: false                    |
|category     |string     |null: false                    |
|condition    |string     |null: false                    |
|delivery_fee |string     |null: false                    |
|send_from    |string     |null: false                    |
|ship_days    |string     |null: false                    |
|price        |integer    |null: false                    |
|user         |references |null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :orders

## orders
|Column |Type       |Options    |
|---    |---        |---        |
|item   |references |null: false|
|user   |references |null: false|

### Association
- belongs_to :users
- belongs_to :items
- has_one :shipping_addresses

## shipping_addresses
|Column     |Type       |Options                        |
|---        |---        |---                            |
|postal_code|integer    |null: false                    |
|prov       |string     |null: false                    |
|city       |string     |null: false                    |
|address    |string     |null: false                    |
|building   |string     |---                            |
|phone      |integer    |null: false                    |
|user       |references |null: false, foreign_key: true |

### Association
- belongs_to :orders
- belongs_to :users