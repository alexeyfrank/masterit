class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :preview
      t.text :content
      t.integer :position
      t.string :state

      t.timestamps
    end
  end
end
