class User < ApplicationRecord
  has_many :auctions
  has_many :bids

  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true, on: :create
  validates :name, uniqueness: true
  validates :email, presence: true, on: :create
  validates :email, uniqueness: true
end
