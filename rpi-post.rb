require 'net/http'
require 'uri'
require 'json'
require 'date'

uri = URI.parse("https://localhost:3000/meters/create_auto")

header = {'Content-Type': 'text/json'}
meter_params = { 'start_date' => '2019-02-03',
                 'end_date' => '2019-03-03',
                 'readings' => '1000'

            }

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = meter_params.to_json

# Send the request
response = http.request(request)
