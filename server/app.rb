require 'sinatra'

$messages = {}

get '/:name' do
  $messages[params[:name]]
end

put '/:name/:message' do
  $messages[params[:name]] = params[:message]
end