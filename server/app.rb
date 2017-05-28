require 'sinatra'
require 'json'

$messages = {}

get '/:name/?' do
  content_type :json
  $messages[params[:name]].to_json
end

put '/:name/?' do
  message = JSON.parse(request.body.read, symbolize_names: true)
  $messages[params[:name]] = message
  200
end