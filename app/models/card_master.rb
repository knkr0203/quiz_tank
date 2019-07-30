class CardMaster < ApplicationRecord
  has_many :card_tmps
  default_scope -> { order(created_at: :desc) }
end