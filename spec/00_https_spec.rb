## NOTE: This test fails when webrick is loaded before any of our code on OSX
require 'webrick'
require 'net/https'
require 'cgi'
require 'uri'
require File.expand_path('../spec_helper.rb', __FILE__)

describe "When webrick is loaded first" do
  it "We should still be able to pull HTTPS" do
    get_url = "https://modolabs-device.appspot.com/api/"
    uri = URI.parse(get_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    response.body.should =~ /supports_certificate/
  end
end
