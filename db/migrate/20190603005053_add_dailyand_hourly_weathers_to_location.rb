class AddDailyandHourlyWeathersToLocation < ActiveRecord::Migration[5.2]
  def change
    add_reference :locations, :hourly_weathers, foreign_key: true
    add_reference :locations, :daily_weathers, foreign_key: true
  end
end
