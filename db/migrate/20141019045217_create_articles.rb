class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :domain
      t.integer :next_page_id
      t.string :url
      t.string :short_url
      t.string :author
      t.string :excerpt
      t.string :direction
      t.integer :word_count
      t.integer :total_pages
      t.text :content
      t.string :date_published
      t.string :dek
      t.string :lead_image_url
      t.string :title
      t.integer :rendered_pages

      t.timestamps
    end
  end
end
