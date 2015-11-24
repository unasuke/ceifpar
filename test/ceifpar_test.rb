require 'test_helper'
require_relative '../lib/ceifpar'

class CeifparTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ceifpar::VERSION
  end

  def test_is_jpeg?
    ["jpeg", "jpg", "JPEG", "JPG"].each do |ext|
      assert_equal true, Ceifpar.is_jpeg?("hoge.#{ext}")
    end

    ["png", "gif", "txt"].each do |ext|
      assert_equal false, Ceifpar.is_jpeg?("hoge.#{ext}")
    end
  end

  def test_normalize_ratio
    ["1/2", "50%", "0.5"].each do |rate|
      assert_equal 0.5, Ceifpar.normalize_ratio(rate)
    end

    ["1/5", "20%", "0.2"].each do |rate|
      assert_equal 0.2, Ceifpar.normalize_ratio(rate)
    end
  end

end
