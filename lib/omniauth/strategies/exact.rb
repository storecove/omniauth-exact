require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Exact < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://start.exactonline.nl',
        authorize_url: 'https://start.exactonline.nl/api/oauth2/auth',
        token_url: 'https://start.exactonline.nl/api/oauth2/token'
      }

      def request_phase
        super
      end

      uid{ raw_info['feed']['entry']['content']['properties']['UserID']['__content__'] }

      info do
        {
          name: raw_info['feed']['entry']['content']['properties']['FullName'],
          email: raw_info['feed']['entry']['content']['properties']['Email'],
          division: raw_info['feed']['entry']['content']['properties']['CurrentDivision']['__content__']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        return @raw_info if @raw_info
        raw_info = access_token.get('/api/v1/current/Me').parsed
        s2s =
          lambda do |h|
            Hash === h ?
              Hash[
                h.map do |k, v|
                  [k.sub(/.*?:/, ''), s2s[v]]
                end
              ] : h
          end
        @raw_info = s2s[raw_info]
      end
    end
  end
end
