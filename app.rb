require "sinatra"
require "./db/connection"

set :method_override, true

# Homepage
get "/" do
  @user = User.new
  erb :"home/index.html", layout: :"layout/application.html"
end

# Create  Users # create
post "/users" do
  @user = User.new(params["user"])
  if @user.save
    redirect "/users/#{@user.id}/lists/new"
  else
    erb :"home/index.html", layout: :"layout/application.html"
  end
end

get "/users/:user_id/lists/new" do
  @user = User.find(params["user_id"])
  @list = @user.lists.build
  erb :"lists/index.html", layout: :"layout/application.html"
end
