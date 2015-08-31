require "sinatra"
require "pg"

# config :development do
#   set :db_config, { dbname: "restaurants"}
# end
#
# configure :production do
#   uri = URI.parse(ENV["DATABASE_URL"])
#   set :db_config, {
#     host: uri.host,
#     port: uri.port,
#     dbname: uri.path.delete('/'),
#     user: uri.user,
#     password: uri.password
#   }
# end

def db_connection
  begin
    connection = PG.connect(settings.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get "/" do
  redirect "/homepage"
end

get "/homepage" do
  erb :index ##, locals: { tasks: tasks }
end

get "/aboutus" do
  #"<p>Hello, world! The current time is #{Time.now}.</p>"
  erb :about_us
end
