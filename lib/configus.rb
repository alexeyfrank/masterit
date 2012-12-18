Configus.build Rails.env do
  env :production do
    site_name "Master IT"
    admin_entities_per_page 10
  end

  env :test, :parent => :production do

  end

  env :development, :parent => :production do

  end
end
