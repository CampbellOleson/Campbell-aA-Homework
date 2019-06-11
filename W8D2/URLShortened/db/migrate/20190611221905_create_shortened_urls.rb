class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id
      t.string :short_url 
      t.string :long_url 
      
      t.timestamps
      
    end
    add_index(:shortened_urls, :long_url)
    add_index(:shortened_urls, :short_url)
  end
end


