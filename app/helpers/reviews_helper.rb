module ReviewsHelper

    def new_review_header
        #checking to see if params has a resource_id, if it does it renders the name of the resource, else renders the create review
        if @resource
            "Add Review for #{@resource.site_name}"
        else 
            "Create Review"
        end 
    end

    def index_review_header
        if @resource
            "All Reviews for #{@resource.site_name}"
        else 
            "All Reviews"
        end 
    end
end

