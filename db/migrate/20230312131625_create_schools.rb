class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string  :name, null: false, default: "", index: true
      t.text    :address, null: false, default: ""
      t.string  :email, null: false, default: "", unique: true
      t.integer :admin_id, null: false, index: true
      t.timestamps
    end
  end
end
