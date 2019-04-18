require 'sinatra'
require 'rest-client'
require 'json'
require 'oauth2'



app_id = 'cf36a8d5ce6d92515364f7a9db321af0514fc3da8cba932732b116acc4c05f04'
secret = '723c4c2d94cfe8be7bbb2b337b36e861443992c02fd2db3fb3bc52476bcb94bd'

callback = 'http://localhost:4567/callback'


client = OAuth2::Client.new(app_id, secret, site: "http://localhost:3000/meters/create_auto")
request_authorization_uri = client.auth_code.authorize_url(redirect_uri: callback)

code = ''

if(code.empty?)

  get '/register/001' do
    redirect client.auth_code.authorize_url(redirect_uri: callback)
  end

  get "/callback" do
    code = params["code"]
    redirect "/authorized"
  end

  get "/authorized" do
    "Your Smart Meter has been authorized!"
  end

  get "/code" do
    "code = " + code
  end

  get '/send_meters' do
    access = client.auth_code.get_token(code, redirect_uri: callback)
    token = access.token
    payload = {
	     meter: {
		       start_date: '2018-5-4',
		       end_date: '2018-6-4',
		       readings: '1999',
           user_id: '1'
	    }
    }
    headers = {
	     content_type: :json,
	     accept: :json,
	     authorization: 'Bearer '+token
    }

    RestClient.post("http://localhost:3000/meters/create_auto", JSON.pretty_generate(payload),headers)
  end

else

  get "/register/001" do
    redirect "/already_authorized"
  end

  get "/already_authorized" do
    "Your Smart Meter has already been authorized"
  end

  get "/callback" do
    code = params["code"]
    redirect "/authorized"
  end

  get "/authorized" do
    "Your Smart Meter has been authorized!"
  end

  get "/code" do
    "code = " + code
  end


end
