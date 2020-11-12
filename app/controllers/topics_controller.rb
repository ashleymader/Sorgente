class TopicsController < ApplicationController

    def index
        @topics = Topic.all 
    end

    def show
        @topic = Topic.find_by_id(params[:id])
        @resources = @topic.resources
    end

end
