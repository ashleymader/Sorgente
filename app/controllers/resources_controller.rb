class ResourcesController < ApplicationController


    def new 
        @resource = Resource.new 
        @resource.build_topic 
    end

    def create 
        @resource = Resource.new(resource_params)
        @resource.user_id = session[:user_id]
        if @resource.save
            redirect_to resource_path(@resource)
        else  
            #needed to add this line to keep the topic build field on new resource form
            @resource.build_topic
            render :new
        end
    end

    def show
        @resource = Resource.find_by_id(params[:id])
    end

    def index
        @resources = Resource.all
    end

    private 

    def resource_params 
        params.require(:resource).permit(:site_name, :url, :description, :topic_id, topic_attributes: [:name])
    end


end
