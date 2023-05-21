Rails.application.routes.draw do

  devise_for :users
  
  get 'user/show'
  get 'static_pages/landing_page'
  get 'static_pages/dashboard'
  get 'static_pages/valid_airdrip', to: 'static_pages#valid_airdrip', as: 'valid_airdrip'


  resources :albums, param: :report_id do
    post 'validate', on: :member
    #get 'index', on: :collection
    get 'dashboard', on: :member

  end

    #root 'gib#index' # Add this line to set the root page to the index action of the Gib controller 
    resources :gib, param: :report_id do
      post 'validate', on: :member
      #get 'index', on: :collection
      get 'dashboard', on: :member
    end


  

   #namespace :albums do
   #  resources :songs
   #end
   
 resources :songs, only: [:index], path: 'my-mining-report'
 resources :networks, only: [:index], path: 'network-activity'
 resources :scoreboards, only: [:index], path: 'my-airdrips'


 resources :tag, only: [:index]


  # Versuch MY an Songs/my, custom action in songs controller
  get '/my', to: "songs#my"

  resources :songs do
    collection do
      get 'my'
    end
  end
  # ENDE Versuch MY an Songs/my

   #  get '/songs/report/:report_id', to: 'songs#index', as: 'songs_report'
   #  get 'songs/:report_id', to: 'songs#show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show], param: :slug

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: "home#index"
  root 'static_pages#landing_page'

  post 'albums/validate_code', to: 'albums#validate_code'
  post 'gib/validate_code', to: 'gib#validate_code'

  get 'dashboard', to: 'albums#index'


end
