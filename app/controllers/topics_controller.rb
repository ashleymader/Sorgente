class TopicsController < ApplicationController

    def index
        @pagy, @topics = pagy(Topic.all, items: 20)
    end

    def show
        @topic = Topic.find_by_id(params[:id])
        if !@topic
            redirect_to topics_path
            flash[:error] = "Topic with that ID does not exist"
            #do I want this here? this is to avoid url manupilation errors... maybe add custom error page for pages that don't exist? 
        else  
            @pagy, @resources = pagy(@topic.resources, items: 15)
        end
    end

end
