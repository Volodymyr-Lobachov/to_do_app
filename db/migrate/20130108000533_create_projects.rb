class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
    add_index :projects, :user_id
  end
end
