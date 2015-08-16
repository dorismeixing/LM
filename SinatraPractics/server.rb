require "sinatra"
#require "pry"

use Rack::Session::Cookie, {
  secret: "change_me",
  expire_after: 86400 # seconds
}

get "/" do
  # Check to see if the session contains a visit counter already. If this is
  # the first time visiting the site the value will be nil.
  if session[:visit_count].nil?
    visit_count = 1
  else
    # Everything in the session is stored as key-value strings. We need to
    # convert back to an integer before we can use this value in our app.
    visit_count = session[:visit_count].to_i
  end

  session[:visit_count] = visit_count + 1

  "You've visited this page #{visit_count} time(s).\n"
end

get "/tasks" do
  tasks = File.readlines("tasks.txt")
  erb :index, locals: { tasks: tasks }
end

get "/articles" do
  articles = File.readlines("articles.txt")
  erb :article, locals: { articles: articles }
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

post "/articles" do
  article = params["article_name"]

  File.open("articles.txt", "a") do |file|
    file.puts(article)
  end

  redirect "/articles"
end

# These lines can be removed since they are using the default values. They've
# been included to explicitly show the configuration options.
set :views, File.join(File.dirname(__FILE__), "views")
set :public_folder, File.join(File.dirname(__FILE__), "public")
