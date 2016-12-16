class ImgurClient
  def initialize
    @ImgurClient = Imgur.new 'be637321cf3de65'
  end

  def uploadImage(path)
    local_image = Imgur::LocalImage.new(path, title: 'Awesome photo')
    imgur_image = @ImgurClient.upload local_image
    imgur_image.link
  end
end