require 'rest-client'
require 'json'

#create basic auth
payload = {
	meter: {
		start_date: '2019-02-03',
		end_date: '2019-03-03',
		readings: '1000'
	}
}

headers = {
	content_type: :json, 
	accept: :json,
	authorization: 'Bearer adijsdoj3234ineinsdasndi3n4k4j3 jknjbabdskbasdas'
}

RestClient.post("http://localhost:3000/meters/create_auto", JSON.pretty_generate(payload),headers)


# You get your smart device
# You login using OAuth into your app
# Smart devise listens for OAuth callback and registers itself with main app
# Smart devise uses oauth token to post readings
# Main app associates meter readings using oauth token
