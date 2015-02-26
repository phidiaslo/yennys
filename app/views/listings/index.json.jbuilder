json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :description, :price, :processing_time, :view_count, :status, :slug, :user_id, :subcategory_id, :location_id
  json.url listing_url(listing, format: :json)
end
