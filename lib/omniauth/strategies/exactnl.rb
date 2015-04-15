require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Exactnl < OmniAuth::Strategies::OAuth2
      option :name, 'Exactnl'
      option :client_options, { site: 'https://start.exactonline.nl' }

      uid{ raw_info['id'] }

      info do
        {
          name: raw_info['name'],
          email: raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end
