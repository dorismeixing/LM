require "sinatra"
#require "pry"

get "/" do
  "Hello, world!"
end

get "/tasks" do
  tasks = File.readlines("tasks.txt")
  erb :index, locals: { tasks: tasks }
end


get "/tasks/:task_name" do
  erb :show, locals: { task_name: params[:task_name] }
end

get "/hello" do
  "<p>Hello, world! The current time is #{Time.now}.</p>"
end

post "/tasks" do

  # Temporarily insert a debugger breakpoint here so
  # we can view the *params* hash.
  #binding.pry
  # Read the input from the form the user filled out
  task = params["task_name"]

  # Open the "tasks.txt" file and append the task
  File.open("tasks.txt", "a") do |file|
    file.puts(task)
  end

  # Send the user back to the home page which shows
  # the list of tasks
  redirect "/tasks"
end

# These lines can be removed since they are using the default values. They've
# been included to explicitly show the configuration options.
set :views, File.join(File.dirname(__FILE__), "views")
set :public_folder, File.join(File.dirname(__FILE__), "public")
