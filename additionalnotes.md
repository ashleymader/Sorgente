<%= render partial: 'layouts/errors', locals: {object: @resource} %>

 <div class="resource-form">
    <%= form_for @resource do |f|%>
    
    <div class="form-icon">
        <span><i class="fas fa-laptop-code"></i></span>
    </div>

    <h2 class="text-center">Resource Form</h2>
   

    <div class="form-group">
        <%= f.hidden_field :site_name %>
    </div> 

    <div class="form-group">
        <input class="form-control item" placeholder="http://www.websiteurl.com"<%= f.text_field :url %> 
    </div>

    <div class="form-group">
        <%= f.hidden_field :description %>
    </div>

    <div class="form-group">
         <select class="form-control item" <%= f.collection_select(:topic_id, Topic.all, :id, :name, include_blank: "Select Topic") %> 
    </div>

    <div>
        <%= f.fields_for :topic do |t| %>
            <input class="form-control item" placeholder="Create Topic Not Listed"<%= t.text_field :name %>
        <% end %>
    </div>

    <div class="form-group">
        <button class="btn btn-block submit-resource" <%= f.submit %>Submit Resource</button>
    </div>

    <% end %>
</div>