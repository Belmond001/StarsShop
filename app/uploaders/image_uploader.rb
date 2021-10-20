class ImageUploader < Shrine

    #plugin :moving
    plugin :validation_helpers
    Attacher.validate do
      validate_mime_type_inclusion %w[image/jpeg image/png image/gif]
      validate_max_size 5*1024*1024
      validate_extension_inclusion %w[jpg jpeg png gif]
    end
  
  end