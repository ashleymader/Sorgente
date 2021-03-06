class ReviewsController < ApplicationController
    load_and_authorize_resource
    before_action :set_review, only:[:show, :edit, :update]

    def index 
        if @resource = Resource.find_by_id(params[:resource_id])
            @pagy, @reviews = pagy(@resource.reviews.includes(:user), items: 9)
            #eager load user with the review because we are accessing all user reviews
        else  
            @pagy, @reviews = pagy(Review.all.includes(:user, :resource), items: 9)
            #eager load user and resource with the reviews because we are accessing all user reviews
        end
    end

    def new 
        @review = Review.new
        @resource = Resource.find_by_id(params[:resource_id])
        # if @resource = Resource.find_by_id(params[:resource_id])
        #     @review = @resource.reviews.build
        # else  
        #     @review = Review.new
        # end
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
 
    end

    def edit 
     
    end

    def update    
        if @review.update(review_params)
            redirect_to review_path(@review)
        else  
            render :edit
        end
    end

    private 

    def review_params 
        params.require(:review).permit(:resource_id, :stars, :comment, :title )
    end

    def set_review
        @review = Review.find_by_id(params[:id])
    end

end
