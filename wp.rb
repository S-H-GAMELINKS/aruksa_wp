require 'arukas'
require 'dotenv'

Dotenv.load

arukas = Arukas::API::new(ENV["ARUKAS_JSON_API_TOKEN"], ENV["ARUKAS_JSON_API_SECRET"])

json = File.read("wp.json")
res = arukas.create_apps(json)

res = arukas.get_services
id = JSON.parse(res)["data"][0]["id"]
arukas.power_on_service(id)
