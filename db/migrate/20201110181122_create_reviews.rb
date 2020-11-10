class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :stars
      t.string :title
      t.string :comment
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :resource, null: false, foreign_key: true

      t.timestamps
    end
  end
end
