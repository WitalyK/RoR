require 'sinatra'

get '/' do
  erb :index
end

get '/admin' do
  erb :admin
end

post '/' do
  @nameu = params[:nameu]
  @dateu = params[:dateu]
  @timeu = params[:timeu]
  f = File.open './public/user.txt', 'a'
  f.write "Пользователь #{@nameu} придет #{@dateu} в #{@timeu}\n"
  f.close
  erb :message
end

post '/admin' do
  @login = params[:login]
  @pass = params[:pass]
  if @login == 'admin' && @pass == 'admin'
    f = File.open './public/user.txt', 'r'
    @textfrfile = f.readline
    f.close
  end
  erb :admin
end
