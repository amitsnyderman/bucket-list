class Action::Tweet < Action
  # http://dev.twitter.com/pages/libraries#ruby
  # http://twitter.rubyforge.org/
  
  def execute(item)
    Twitter.configure do |config|
      config.consumer_key = Buckets::Application.config.twitter_consumer_key
      config.consumer_secret = Buckets::Application.config.twitter_consumer_secret
      config.oauth_token = Buckets::Application.config.twitter_oauth_token
      config.oauth_token_secret = Buckets::Application.config.twitter_oauth_token_secret
      
      # config.oauth_token = oauth_token
      # config.oauth_token_secret = oauth_token_secret
    end
    
    client = Twitter::Client.new
    client.update(item.text)
  end
end
