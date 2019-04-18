require 'rest-client'
require 'json'
require 'oauth2'

auth_token_user1 = 'cd3f34feb6859ce4a33d'

app_id = 'cf36a8d5ce6d92515364f7a9db321af0514fc3da8cba932732b116acc4c05f04'
secret = '723c4c2d94cfe8be7bbb2b337b36e861443992c02fd2db3fb3bc52476bcb94bd'

client = OAuth2::Client.new(app_id, secret, site: "http://localhost:3000/meters/create_auto")

#request_authorization_uri ='http://localhost:3000/oauth/authorize?client_id='+app_id+'&redirect_uri=urn:ietf:wg:oauth:2.0:oob&response_type=code'
response_request = RestClient.get(request_authorization_uri)

#Or the get request can be written like this?
RestClient.get('http://localhost:3000/oauth/authorize?',{params:{'client_id' => client_id, 'redirect_uri' => 'urn:ietf:wg:oauth:2.0:oob'	,'response_type' => 'code'}})


#changed the authorization to skip_authorization and authenticate with the user's auth_token

#after the authorization the callback url will contain the code to use


parameters = 'client_id='+ app_id +'&client_secret='+ secret +'&code=RETURNED_CODE&grant_type=authorization_code&redirect_uri=urn:ietf:wg:oauth:2.0:oob'
request_access_token = RestClient.post('http://localhost:3000/oauth/token', parameters)

bearer = access.token


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
	authorization: 'Bearer '
}

RestClient.post("http://localhost:2999/meters/create_auto", JSON.pretty_generate(payload),headers)


# You get your smart device
# You login using OAuth into your app
# Smart devise listens for OAuth callback and registers itself with main app
# Smart devise uses oauth token to post readings
# Main app associates meter readings using oauth token
