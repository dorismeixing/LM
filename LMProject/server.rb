require "sinatra"


get "/homepage" do
  erb :index ##, locals: { tasks: tasks }
end

get "/aboutus" do
  #"<p>Hello, world! The current time is #{Time.now}.</p>"
  erb :AboutUs
end
