Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :books, only: [:index, :show]
      resources :users, only: [:show, :create]
      resources :authenticate, only: [:create]
      resources :comments, only: [:create, :destroy]
      resources :ratings, only: [:create]
      get '/comments/:book_id', to: 'comments#bookcomments'
      get '/is-signed-in', to: 'users#signed_in'
      get '/user-rating/:book_id', to: 'ratings#user_rating'
    end
  end
end
