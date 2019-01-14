Rails.application.routes.draw do

  resources :tournaments
  resources :users
  resources :promotions
  resources :badges

  scope :chats do
    get "/user_chats/:user_id", to: "chats#user_chats", as: :user_chats
    get "/tournament_chats/:tournament_id", to: "chats#tournament_chats", as: :tournament_chats
  end

  scope :home do
    get "/run_task/:task", to: "home#run_task", as: :run_task
  end

  root to: "home#index"


end
