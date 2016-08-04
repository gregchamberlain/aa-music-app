class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.string :name
      t.text :lyrics
      t.string :kind

      t.timestamps null: false
    end
    add_index :tracks, :album_id
  end
end
