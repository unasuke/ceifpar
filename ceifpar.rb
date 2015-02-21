#!/usr/bin/env ruby
#ceifpar
#conceal(clear) exif info from photo and resize it.

require 'optparse'
#require 'rugygems'
require 'rmagick'
#require 'mimemagic'

def is_jpeg? filepath
  if File.extname(filepath).downcase =~ /jpe?g/ then
    return true
  else
    return false
  end
end

#example for resize ratio format
# "1/2" , "0.5" , "50%" -> 0.5
def normalize_ratio str
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

params = ARGV.getopts('r:')
ARGV.each{ |arg|
  if is_jpeg?(arg) then
    #open image
    img = Magick::ImageList.new(arg)

    #resize image
    img.resize!(normalize_ratio(params["r"])) unless params["r"] == nil

    #delete exif
    img.strip!

    #output image
    dst = File.basename(arg)
    dst[/\./] = "-dst."
    img.write(dst)

  else
    warn "#{arg} is not jpeg image."
  end
}

warn "No input image." if ARGV.size == 0
