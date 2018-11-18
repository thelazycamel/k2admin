Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources :tournaments
  resources :users
  resources :promotions

  scope :chats do
    get "/user_chats/:user_id", to: "chats#user_chats", as: :user_chats
    get "/tournament_chats/:tournament_id", to: "chats#tournament_chats", as: :tournament_chats
  end

  root to: "home#index"

end
