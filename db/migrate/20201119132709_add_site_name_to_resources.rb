class AddSiteNameToResources < ActiveRecord::Migration[6.0]
  def change
    add_column :resources, :site_name, :string
  end
end
