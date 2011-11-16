require 'json'
require 'ostruct'
require 'net/https'
require 'cgi'
require 'uri'

module KurogoDeviceDetection
  class Device
    attr_reader :test, :user_agent, :api_version

    def initialize(opts={})
      @user_agent = opts[:user_agent] || ""
      @api_version = opts[:api_version] || "2"
      @test = opts[:test] ? true : false
    end

    # Get the correct URL based on whether we're in
    # test mode or not
    def url
      if @test
        "https://modolabs-device-test.appspot.com/api/"
      else
        "https://modolabs-device.appspot.com/api/"
      end
    end

    # Set test mode
    # Should be a boolean
    def test=(test)
      @test = test ? true : false
    end

    # Set @user_agent
    # This will clear the detect instance
    def user_agent=(user_agent)
      clear
      @user_agent = user_agent
    end

    # Set @api_version
    # This will clear the detect instance
    def api_version=(api_version)
      clear
      @api_version = api_version
    end

    # Run the detection
    def detect
      @detect ||= OpenStruct.new(JSON.parse(get_remote))
    end

    private

    def get_remote
      get_url = "#{url}?version=#{CGI.escape(@api_version)}&user-agent=#{CGI.escape(@user_agent)}"
      uri = URI.parse(get_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      response.body
    end

    def clear
      @detect = nil
    end
  end
end
