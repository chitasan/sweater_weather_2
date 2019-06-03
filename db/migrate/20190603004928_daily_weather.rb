class DailyWeather < ActiveRecord::Migration[5.2]
  def change
     create_table :daily_weathers do |t|
      t.jsonb :daily_weather_info
      
      t.timestamps
    end
  end
end
