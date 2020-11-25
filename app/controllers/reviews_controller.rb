class ReviewsController < ApplicationController

    def index 
        if @resource = Resource.find_by_id(params[:resource_id])
            @reviews = @resource.reviews
            
        else  
            @reviews = Review.all 
        end
    end

    def new 
        if @resource = Resource.find_by_id(params[:resource_id])
            @review = @resource.reviews.build
        else  
            @review = Review.new
        end
    end

    def create 
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else  
            render :new
        end
    end

    def show 
        @review = Review.find_by_id(params[:id])
    end

    private 

    def review_params 
        params.require(:review).permit(:resource_id, :stars, :comment, :title )
    end
end
