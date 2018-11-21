defmodule DrabSpeedWeb.Router do
  use DrabSpeedWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DrabSpeedWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :main
    
    get "/example1", Example1Controller, :main_page
    get "/example2", Example2Controller, :main_page
    get "/example3", Example3Controller, :main_page

  end

  # Other scopes may use custom stacks.
  # scope "/api", DrabSpeedWeb do
  #   pipe_through :api
  # end
end
