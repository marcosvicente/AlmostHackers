class CreateExames < ActiveRecord::Migration[7.0]
  def change
    create_table :exames do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
