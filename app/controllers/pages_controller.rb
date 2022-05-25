class PagesController < ApplicationController
  def home
    @grannies = Granny.all
    # the `geocoded` scope filters only grannies with coordinates (latitude & longitude)
    @markers = @grannies.geocoded.map do |granny|
      {
        lat: granny.latitude,
        lng: granny.longitude,
        info_window: render_to_string(partial: "info_window", locals: { granny: granny }),
        image_url: helpers.asset_url("logo_granny.png")
      }
    end
  end
end
