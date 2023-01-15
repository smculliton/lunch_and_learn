class LearningResourceSerializer
  include JSONAPI::Serializer

  attributes :video, :images, :country 
  set_id { nil }
end