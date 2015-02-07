#ruby all the things
require 'tumblr_client'

class LinkToTumbler

  include Cinch::Plugin

  listen_to :channel

  def listen(m)
    TumblerAPI.post_message(m.message) if m.message.include?("http:")
  end

end

class TumblerAPI 
  #Tumbler API
  @@client = Tumblr::Client.new({
    :consumer_key => ENV['consumer_key']
    :consumer_secret => ENV['consumer_secret']
    :oauth_token => ENV['oauth_token']
    :oauth_token_secret => ENV['oauth_token_secret']
  })
  
  def self.post_message(message) 
    @@client.text("cvtc-jeeves.tumblr.com", :body => message, :state => "posts") if message.include?("http:")
  end
end
