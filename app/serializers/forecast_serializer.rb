class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :forecast_weather, :id
end
