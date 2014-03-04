class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems do |t|
      t.string :name
      t.string :link
      t.string :username
      t.string :password
      t.integer :user_id

      t.timestamps
    end
  end
end
