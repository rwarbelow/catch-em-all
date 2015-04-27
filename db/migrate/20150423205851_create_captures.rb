class CreateCaptures < ActiveRecord::Migration
  def change
    create_table :captures do |t|
      t.references :game, index: true, foreign_key: true
      t.references :pokemon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
