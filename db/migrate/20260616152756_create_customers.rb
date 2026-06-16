class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :fullname
      t.string :phoneno
      t.string :emailaddress
      t.string :notes
      t.image  :image

      t.timestamps
    end
  end
end
