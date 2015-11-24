require "ceifpar/version"
require 'rmagick'

module Ceifpar
  class << self
    def write_image(image, dst_path)
      image.write(dst_path)
    end

    def resize_image(image, ratio)
      image.resize(ratio)
    end

    def resize_image_with_path(path, ratio)
      return false unless self.is_jpeg?(path)

      image = Magick::ImageList.new(path)
      image.resize(ratio)
    end

    def remove_exif!(image)
      image.strip!
    end

    def remove_exif_with_path(path)
      return false unless self.is_jpeg?(path)

      image = Magick::ImageList.new(path)
      image.strip!
    end

    def is_jpeg?(path)
      if File.extname(path).downcase =~ /jpe?g/
        return true
      else
        return false
      end
    end

    def normalize_ratio(str)
      #fraction
      if str.include?("/") then
        rat = str.partition("/")
        ratio = Rational(rat[0].to_f , rat[2].to_f).to_f
      #percent
      elsif str.include?("%") then
        ratio = str.to_f / 100
      #decimal
      else
        ratio = str.to_f
      end
      return ratio
    end
  end
end
