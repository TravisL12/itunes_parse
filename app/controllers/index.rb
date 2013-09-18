get '/' do
  erb :index
end

post '/upload' do

  params_file = params[:demo] ? (redirect '/demo') : params[:itunes_file]

  if params_file[:type] == "text/xml"
    @all_songs = parse_songs(params_file[:tempfile])
    erb :itunes_stats
  else
    flash[:danger] = "Please Upload an XML File"
    redirect '/'
  end
end

get '/demo' do
  @all_songs = parse_songs('itunes_xml/itunes_demo.xml')
  erb :itunes_stats
end
