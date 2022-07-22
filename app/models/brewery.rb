class Brewery < ApplicationRecord
  include RatingAverage

  validates :name, length: { minimum: 1 }
  validates :year, numericality: { only_integer: true, greater_than: 1039 }
  validate :year_cannot_be_larger_than_current

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  def print_report
    puts name
    puts "established in the year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2018
    puts "changed year to #{year}"
  end

  def year_cannot_be_larger_than_current
    year > Date.today.year && errors.add(:year, "Can't be larger than current year")
  end
end
