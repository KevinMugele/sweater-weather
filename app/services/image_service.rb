class ImageService
  class << self
    def get_image(location)
      ImageClient.get_background_image(location)
    end
  end
end
