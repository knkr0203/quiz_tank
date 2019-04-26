class CardTmp < ApplicationRecord
  belongs_to :card_master
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
end