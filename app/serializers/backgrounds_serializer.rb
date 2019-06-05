class BackgroundsSerializer
  include FastJsonapi::ObjectSerializer

  set_id :object_id
  attributes :background_url
end