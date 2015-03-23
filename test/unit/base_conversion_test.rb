require 'test_helper.rb'
require 'base_conversion'

class BaseConversionTest < MiniTest::Test

  def test_convert_hello_world_to_binary
    bot = make_bot(BaseConversion)
    message = make_message(bot, '!to_binary hello world')
    replies = get_replies(message)
    assert_equal "01101000 01100101 01101100 01101100 01101111 00100000 01110111 01101111 01110010 01101100 01100100", replies.first
  end

  def test_convert_hello_world_to_hex
    bot = make_bot(BaseConversion)
    message = make_message(bot, '!to_hex hello world')
    replies = get_replies(message)
    assert_equal "68 65 6c 6c 6f 20 77 6f 72 6c 64", replies.first
  end

  def test_convert_binary_to_hello_world
    bot = make_bot(BaseConversion)
    message = make_message(bot, '!binary_to_string 01101000 01100101 01101100 01101100 01101111 00100000 01110111 01101111 01110010 01101100 01100100')
    replies = get_replies(message)
    assert_equal 'hello world', replies.first
  end

  def test_convert_1010_to_integer
    bot = make_bot(BaseConversion)
    message = make_message(bot, '!binary_to_integer 1010')
    replies = get_replies(message)
    assert_equal '10', replies.first
  end

end
