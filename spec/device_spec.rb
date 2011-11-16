require File.expand_path('../spec_helper.rb', __FILE__)

describe KurogoDeviceDetection, "#Device" do
  it "properly detects your device based on user-agent" do
    iphone = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_3_3 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5"
    safari = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_2) AppleWebKit/534.51.22 (KHTML, like Gecko) Version/5.1.1 Safari/534.51.22"

    k = KurogoDeviceDetection::Device.new
    k.user_agent = iphone
    detect = k.detect
    detect.platform.should == "iphone"
    detect.pagetype.should == "compliant"

    k.user_agent = safari
    detect = k.detect
    detect.platform.should == "computer"
    detect.pagetype.should == "compliant"
  end
end
