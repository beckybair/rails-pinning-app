# config/initializers/paperclip_media_type_spoof_detector_override.rb
require 'paperclip/media_type_spoof_detector'

require 'paperclip/media_type_spoof_detector'
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end