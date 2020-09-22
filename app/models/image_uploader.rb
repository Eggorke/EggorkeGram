require "image_processing/mini_magick"
 
class ImageUploader < Shrine
  plugin :validation_helpers

  Attacher.validate do
    validate_extension %w[jpg jpeg png WEBP]
  end
    
end