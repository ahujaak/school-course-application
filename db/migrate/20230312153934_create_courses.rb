class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.references :school, foreign_key: true
      t.text :description, null: false

      t.timestamps
    end
  end
end
