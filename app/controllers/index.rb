get '/' do
  erb :index
end

post '/upload' do
  if params[:itunes_file][:type] == "text/xml"
    @all_songs = parse_songs(params[:itunes_file][:tempfile])
    flash[:success] = "Upload Success!"
    @all_songs
    redirect '/itunes_stats'
  else
    flash[:danger] = "Please Upload an XML File"
    redirect '/'
  end
end

get '/itunes_stats' do
  erb :itunes_stats
end
