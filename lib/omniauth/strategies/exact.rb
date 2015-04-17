require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Exact < OmniAuth::Strategies::OAuth2
      option :name, 'Exact'
      option :client_options, {
        site: 'https://start.exactonline.nl',
        authorize_url: 'https://start.exactonline.nl/api/oauth2/auth',
        token_url: 'https://start.exactonline.nl/api/oauth2/token'
      }

      def request_phase
        super
      end

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
