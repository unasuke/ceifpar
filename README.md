# Ceifpar
Ceifpar is the ruby script to conceal(clear) exif info from photo and resize it.

## Usage
```shell
#delete exif information and resize image to half
$ ruby ceifpar.rb -r 1/2 hoge.jpg
$ ruby ceifpar.rb -r 0.5 hoge.jpg
$ ruby ceifpar.rb -r 50% hoge.jpg

#delete exif information only
$ ruby ceifpar.rb hoge.jpg
```

## Dependency
- [imagemagick](http://www.imagemagick.org/)
- [RMagick](https://github.com/rmagick/rmagick)

## Install
### OS X
```shell
# homebrew
$ brew install imagemagick

# MacPorts
$ sudo port install imagemagick

$ gem install rmagick
$ git clone https://github.com/unasuke/ceifpar.git
```

### Linux
```shell
# apt
$ sudo apt-get install imagemagick

# yum
$ yum install imagemagick

$ gem install rmagick
$ git clone https://github.com/unasuke/ceifpar.git
```

## License
This software is released under the MIT License, see LICENSE.
