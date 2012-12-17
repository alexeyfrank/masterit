class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    add_index :menus, :name
  end
end
