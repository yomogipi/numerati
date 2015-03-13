class DataController < ApplicationController

  def show
    xy_points = {
      "type" =>  "FeatureCollection",
      "features"=> [
      ]
    }
    db = Mongoid::Sessions.default
    db[:points].find.each do |doc|
      xy_points["features"] << 	{
				"type"=>"Feature",
				"properties"=>{"project_name" => "project_a"}, 
				"geometry"=>{"type"=>"Point","coordinates"=>doc["coordinates"]}
				}
    end
    render :json => xy_points
  end
end
