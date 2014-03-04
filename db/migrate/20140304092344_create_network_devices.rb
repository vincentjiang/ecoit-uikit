class CreateNetworkDevices < ActiveRecord::Migration
  def change
    create_table :network_devices do |t|
      t.string :name
      t.string :ip
      t.string :kind
      t.string :place
      t.string :position
      t.string :sn
      t.date :service_expired_day
      t.text :function
      t.text :remark
      t.integer :user_id

      t.timestamps
    end
  end
end
