module RatingAverage
    extend ActiveSupport::Concern

    def average_rating
        average = ratings.reduce(0){ |sum, rating| sum + rating.score }.to_f / ratings.count

        return average
    end

end