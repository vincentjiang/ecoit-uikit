class CreateSoftwares < ActiveRecord::Migration
  def change
    create_table :softwares do |t|
      t.string :name
      t.string :kind
      t.string :sn
      t.date :service_expired_day
      t.text :function
      t.text :remark
      t.integer :user_id

      t.timestamps
    end
  end
end
