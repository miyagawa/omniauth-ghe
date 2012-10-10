require 'omniauth-oauth2'
require 'hashie'

module OmniAuth
  module Strategies
    class GHE < OmniAuth::Strategies::OAuth2
      option :url, nil

      def client_options
        {
          :site => "#{options.url}/api/v3",
          :authorize_url => "#{options.url}/login/oauth/authorize",
          :token_url => "#{options.url}/login/oauth/access_token"
        }
      end

      def client
        ::OAuth2::Client.new(options.client_id, options.client_secret, client_options)
      end

      def request_phase
        super
      end

      uid { raw_info['id'].to_s }

      info do
        {
          'nickname' => raw_info['login'],
          'email' => email,
          'name' => raw_info['name'],
          'image' => raw_info['avatar_url'],
          'urls' => {
            'GitHub Enterprise' => "https://#{url}/#{raw_info['login']}",
            'Blog' => raw_info['blog'],
          },
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/user').parsed
      end

      def email
        raw_info['email'] || (email_access_allowed? ? emails.first : nil)
      end

      def emails
        access_token.options[:mode] = :query
        @emails ||= access_token.get('/user/emails').parsed
      end

      def email_access_allowed?
        options['scope'] && !(options['scope'] == 'public')
      end

    end
  end
end

OmniAuth.config.add_camelization 'ghe', 'GHE'
