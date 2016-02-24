module AlbumsHelper
  def setup_album(album)
    album.singer ||= Singer.new
    album
  end
end