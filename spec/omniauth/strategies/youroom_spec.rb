require 'spec_helper'

describe OmniAuth::Strategies::Youroom do
  subject do
    OmniAuth::Strategies::Youroom.new({})
  end

  context "client options" do
    it 'should have correct name' do
      subject.options.name.should eq("youroom")
    end

    it 'should have correct site' do
      subject.options.client_options.site.should eq('https://www.youroom.in')
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_path.should eq('/oauth/authorize')
    end
  end
end