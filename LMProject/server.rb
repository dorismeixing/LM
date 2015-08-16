require "sinatra"


get "/tasks" do
  erb :index ##, locals: { tasks: tasks }
end

get "/hello" do
  "<p>Hello, world! The current time is #{Time.now}.</p>"
end
