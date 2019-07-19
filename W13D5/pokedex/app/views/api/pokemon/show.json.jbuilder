json.extract! @poke, :id, :name, :attack, :defense, :moves, :poke_type, :image_url, :item_ids
json.items do 
  json.array! @poke.items do |item|
    json.set! item.id do 
      json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
    end
  end
end