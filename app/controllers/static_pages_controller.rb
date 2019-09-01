require 'flickr'

class StaticPagesController < ApplicationController
  
  def home
    flickr = Flickr.new ENV['FLICKR_API_KEY'], ENV['FLICKR_API_SECRET']
    @urls = []

    if params[:nsid]
      public_photos = flickr.people.getPublicPhotos(api_key: ENV['FLICKR_API_KEY'],
                                           user_id: params[:nsid])
      photos_data = public_photos.map { |photo| flickr.photos.getInfo(photo_id: photo.id) }
      @urls = photos_data.map { |info| Flickr.url_m(info) }
    end
  end
end
