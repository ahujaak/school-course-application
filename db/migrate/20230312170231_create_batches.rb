class CreateBatches < ActiveRecord::Migration[6.1]
  def change
    create_table :batches do |t|
      t.string :name, null: false, default: "", index: true
      t.references :school, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.datetime :start_time, null: false
      t.datetime :end_time
      t.timestamps
    end
  end
end
