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
    :consumer_key => ENV['JEEVES_CONSUMER_KEY']
    :consumer_secret => ENV['JEEVES_CONSUMER_SECRET']
    :oauth_token => ENV['JEEVES_OAUTH_TOKEN']
    :oauth_token_secret => ENV['JEEVES_OAUTH_TOKEN_SECRET']
  })
  
  def self.post_message(message) 
    @@client.text("cvtc-jeeves.tumblr.com", :body => message, :state => "posts") 
  end
end
