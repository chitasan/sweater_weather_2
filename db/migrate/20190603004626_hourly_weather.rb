class HourlyWeather < ActiveRecord::Migration[5.2]
  def change
     create_table :hourly_weathers do |t|
      t.jsonb :hourly_weather_info
      
      t.timestamps
    end
  end
end
