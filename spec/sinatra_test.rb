$:.unshift File.expand_path('../../lib',__FILE__)
require 'kurogo_device_detection'
require 'sinatra'
require 'yaml'

# Display the kurogo data based on the user agent
get '/' do
  k = KurogoDeviceDetection::Device.new(:user_agent => request.env['HTTP_USER_AGENT'], :test => true)
  "<pre>User Agent: #{YAML::dump k.detect}</pre>"
end
