require 'sinatra'
require 'rest-client'
require 'json'
require 'oauth2'



APP_ID = 'WJ7jOngcxrEto7RsRN3mgstxCka5_juRl3fl6-P5DNE'
APP_SECRET = 'Jdt8mB1oieZ81LvNoWW4Lki4k0qQdCk5cLycWNWPjkQ'

CALLBACK_URI = URI('http://localhost:4567/callback')

auth_code = File.read('auth_code') if File.exists?('auth_code')

CLIENT = OAuth2::Client.new(APP_ID, APP_SECRET, site: "http://localhost:3000/")

get '/register' do
  scope = params[:scope] || 'read write'
  redirect CLIENT.auth_code.authorize_url(redirect_uri: CALLBACK_URI, scope: scope)
end

get '/callback' do
  if params[:error]
    erb :callback_error, layout: !request.xhr?
  else
    File.write('auth_code', params[:code])
    new_token = CLIENT.auth_code.get_token(params[:code], redirect_uri: CALLBACK_URI)
    File.write('auth_token', new_token.token)
    redirect '/'
  end
end

get '/' do
  'successfully registered'
end

get '/send_meters' do
  redirect '/register' unless auth_code.chomp
  token = File.read('auth_token') if File.exists?('auth_token')
  payload = {
    meter: {
      start_date: '2018-5-4',
      end_date: '2018-6-4',
      readings: '1999'
    }
  }
  headers = {
    content_type: :json,
    accept: :json,
    authorization: 'Bearer '+token
  }

  RestClient.post("http://localhost:3000/meters/create_auto", JSON.pretty_generate(payload),headers)
end
