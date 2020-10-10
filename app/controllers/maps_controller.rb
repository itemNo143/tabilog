class MapsController < ApplicationController

  def index
    @scraps     = Scrap.select('id', 'image', 'latitude', 'longitude').where.not(latitude: 'null', longitude: 'null')
    @coordinate = @scraps.map { |scrap| Hash[:id, scrap.id, :image_url, scrap.image.url, :latitude, scrap.latitude, :longitude, scrap.longitude] }
    gon.scraps  = @coordinate
  end

  def map
    results = Geocoder.search(params[:address])
    @latlng = results.first.coordinates
    # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。

    # respond_to以下の記述によって、remote: trueのアクセスに対して、map.js.erbが変えるようになります。
    respond_to do |format|
      format.js
    end
  end

end
