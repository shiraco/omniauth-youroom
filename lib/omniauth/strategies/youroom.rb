require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Youroom < OmniAuth::Strategies::OAuth
      option :name, 'youroom'
      option :client_options, {:site => 'https://www.youroom.in',
                               :authorize_path => '/oauth/authorize',
                               :request_token_path => '/oauth/request_token',
                               :access_token_path => '/oauth/access_token'}

      uid { raw_info['user']['email'] }

      info do
        {
          :name => raw_info['user']['email'],
          :email => raw_info['user']['email'],
          :participations => raw_info['user']['participations']
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= MultiJson.load(access_token.get('/verify_credentials.json').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end
            
    end
  end
end