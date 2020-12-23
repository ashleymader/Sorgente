class ResourcesController < ApplicationController
    load_and_authorize_resource
    before_action :set_resource, only:[:show, :edit, :update]

    def new 
        @resource = Resource.new 
        @resource.build_topic 
    end

    def create 
        @resource = Resource.new(resource_params)
        @resource.user_id = session[:user_id]
        if @resource.valid? #need this here because it won't check for url presence until after I need aceess to the info in it. Validation will be skippedotherwise
            object = LinkThumbnailer.generate(@resource.url)
            #need to map here because I need access to the new @resource object via the new method call 
            @resource.site_name = object.title
            @resource.description = object.description
            if @resource.save
                redirect_to resource_path(@resource)
            end
        else  
            #needed to add this line to keep the topic build field on new resource form
            @resource.build_topic
            render :new
        end
    end

    def show
        
    end

    def index
        #change to a try method?   
        if params[:q] && !params[:q].empty?
            @resources = Resource.search(params[:q].downcase)
        else 
            @pagy, @resources = pagy(Resource.all, items: 10)
        end
    end

    def edit

    end

    def update 
        if @resource.update(resource_params)
            redirect_to resource_path(@resource)
        else  
            render :edit
        end
    end

    def most_reviewed
        @pagy, @resources = pagy(Resource.most_reviewed, items: 10)
    end

    private 

    def resource_params 
        params.require(:resource).permit(:site_name, :url, :description, :topic_id, topic_attributes: [:name])
    end

    def set_resource 
        @resource = Resource.find_by_id(params[:id])
        redirect_to resources_path if !@resource
    end

end
