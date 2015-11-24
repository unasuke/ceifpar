#!/usr/bin/env ruby

require 'optparse'
require 'ceifpar'

rate = nil
opt = OptionParser.new
opt.on('-r VAL', '--rate=VAL', 'resize rate') { |v| rate = v }
opt.parse!(ARGV)

ARGV.each{ |arg|
  if Ceifpar.is_jpeg?(arg)
    dst_image = Magick::ImageList.new(path)
    Ceifpar.remove_exif!(arg)

    if rate
      ratio = Ceifpar.normalize_ratio(rate)
      dst_image = Ceifpar.resize_image(dst_image)
    end

    dst_path = File.basename(arg)
    dst_path[/\./] = '=dst.'
    dst_image.write(dst_path)

  else
    warn "#{arg} is not jpeg image."
  end
}

warn "No input image." if ARGV.size == 0
