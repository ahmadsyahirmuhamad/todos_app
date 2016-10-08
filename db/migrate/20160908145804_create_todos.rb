class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string   :title
      t.string   :description
      t.integer  :category_id
      t.boolean  :status, default: false
      t.uuid  :user_id
      t.timestamps null: false
    end
  end
end
