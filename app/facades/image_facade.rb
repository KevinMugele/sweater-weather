class ImageFacade
  class << self
    def get_image(location)
      data = ImageService.get_image(location)

      Image.new(data)
    end
  end
end
