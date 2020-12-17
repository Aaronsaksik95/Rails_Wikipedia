class CreateUsertags < ActiveRecord::Migration[6.0]
  def change
    create_table :usertags do |t|

      t.timestamps
    end
  end
end
