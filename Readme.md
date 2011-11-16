## Kurogo Device Detection Ruby Gem

Example:

    require 'kurogo_device_detection'
    device = KurogoDeviceDetection::Device.new(:user_agent => request.env['HTTP_USER_AGENT'])
    if device.detect.pagetype == "compliant"
      puts "We have a compliant browser"
    end

