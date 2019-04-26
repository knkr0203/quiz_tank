class CardMaster < ApplicationRecord
  belongs_to :card_category
  has_many :card_tmps
  default_scope -> { order(created_at: :desc) }
end