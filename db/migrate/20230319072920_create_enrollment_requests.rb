class CreateEnrollmentRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :enrollment_requests do |t|
      t.references :batch, null: false, foreign_key: true
      t.integer :student_id, null: false, index: true
      t.integer :status, null: false, default: 0
      t.integer :approved_by
      t.datetime :approved_at

      t.timestamps
    end
  end
end
