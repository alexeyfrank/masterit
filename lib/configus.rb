Configus.build Rails.env do
  env :development do
    site_name "Master IT"
    admin_entities_per_page 10
  end

  env :test, :parent => :development do

  end

  env :production, :parent => :development do

  end
end
