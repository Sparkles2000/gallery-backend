class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :description
      t.string :art_style
      t.datetime :published_date
      t.string :img_url
      t.belongs_to :artist, foreign_key: true
    end
  end
end
