class LearningResourceSerializer
  include JSONAPI::Serializer

  attributes :country, :video, :images
  set_id { nil }
end