class CurrentWeather < ActiveRecord::Migration[5.2]
  def change
    create_table :current_weathers do |t|
      t.float :temperature
      t.float :feels_like
      t.float :temp_high
      t.float :temp_low
      t.float :humidity
      t.float :visibility
      t.float :uv_index
      t.string :current_summary
      t.string :icon
      t.string :today_summary 
      
      t.timestamps
    end 
  end
end