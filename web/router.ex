defmodule TicTacToe.Router do
  use TicTacToe.Web, :router

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

  scope "/", TicTacToe do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/game", GameController, only: [:new, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", TicTacToe do
  #   pipe_through :api
  # end
end
