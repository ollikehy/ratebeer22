class Beerclub < ApplicationRecord
  has_many :memberships, foreign_key: "beer_club_id"
  has_many :members, through: :memberships, source: :user
end
