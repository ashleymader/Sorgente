module ReviewsHelper

    def new_review_header
        #checking to see if params has a resource_id, if it does it renders the name of the resource, else renders the create review
        if params[:resource_id] 
            "Add Review for #{@resource.site_name}"
        else 
            "Create Review"
        end 
    end

    def index_review_header
        if params[:resource_id] 
            "All Reviews for #{@resource.site_name}"
        else 
            "All Reviews"
        end 
    end
end

