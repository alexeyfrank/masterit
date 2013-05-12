class AddCourseToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :course_id, :integer
  end
end
