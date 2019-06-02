class BackgroundSerializer
  include FastJsonapi::ObjectSerializer

  set_id :object_id
  attributes :background_url
end