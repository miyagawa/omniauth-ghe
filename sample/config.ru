$:.unshift "./lib"
$:.unshift "../omniauth-oauth2/lib"

require 'omniauth'
require 'omniauth-ghe'
require 'sinatra'

use Rack::Session::Cookie

ghe = Class.new(OmniAuth::Strategies::GHE)
ghe.option :name, "example"
ghe.option :url, ENV['EXAMPLE_GITHUB_URL']

use OmniAuth::Builder do
  provider ghe, ENV['EXAMPLE_GITHUB_KEY'], ENV['EXAMPLE_GITHUB_SECRET']
end

get '/' do
  '<a href="/auth/example">Sign in with EXAMPLE</a>'
end

post '/auth/:name/callback' do
  auth = request.env['omniauth.auth']
  "Hi #{auth['name']}"
end

run Sinatra::Application
