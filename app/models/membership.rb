class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :beerclub, foreign_key: "beer_club_id"
end
