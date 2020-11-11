class ReviewsController < ApplicationController

    def index 
        @reviews = Review.all 
    end

    def new 
        @review = Review.new(review_params)
    end
end
