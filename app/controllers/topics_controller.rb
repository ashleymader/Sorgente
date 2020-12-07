class TopicsController < ApplicationController

    def index
        @topics = Topic.all 
    end

    def show
        @topic = Topic.find_by_id(params[:id])
        if !@topic
            redirect_to topics_path
            flash[:error] = "Topic with that ID does not exist"
        else  
            @resources = @topic.resources
        end
    end

end
