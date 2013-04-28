module Extensions
  module MenuExtension
    def current(url)
      where(slug: url).first
    end
  end
end