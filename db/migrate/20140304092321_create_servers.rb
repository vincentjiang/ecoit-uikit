class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :ip
      t.string :ilo
      t.string :brand
      t.string :model
      t.string :sn
      t.string :cpu
      t.string :ram
      t.string :local_disk
      t.string :os
      t.string :place
      t.string :position
      t.date :service_expired_day
      t.text :function
      t.text :remark
      t.integer :user_id

      t.timestamps
    end
  end
end
