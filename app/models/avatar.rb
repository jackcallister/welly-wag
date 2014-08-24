require 'net/http'

class Avatar
  attr_accessor :email, :response

  def initialize(email)
    @email = email
  end

  def self.default_urls
    [
      "/assets/default-avatar-1.png",
      "/assets/default-avatar-2.png",
      "/assets/default-avatar-3.png"
    ]
  end

  # Public: Make a request for the users gravatar with the fallback image
  # set to respond with a 404. Cache the response to prevent duplicate
  # requests with the same instance.
  #
  # Return either the image url or nil.
  #
  def url
    hash = Digest::MD5.hexdigest(@email)
    http = Net::HTTP.new("gravatar.com", 80)
    @response ||= http.request_head("/avatar/#{hash}?default=404")

    if @response.code == "404"
      "http://robohash.org/#{hash}.png"
    else
      "http://www.gravatar.com/avatar/" + hash
    end
  end
end
