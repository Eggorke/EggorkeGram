# frozen_string_literal: true

require 'image_processing/mini_magick'

class ImageUploader < Shrine
  plugin :validation_helpers
  plugin :determine_mime_type

  Attacher.validate do
    validate_extension %w[jpg jpeg png WEBP]
  end
end
