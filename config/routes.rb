Rails.application.routes.draw do
 
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks' } do
      resources :glams  
  end
  
   resources :glams  

  resources :artists do
    resources :glams  
  end

    resources :glams  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   get '/female', to: "artists#female"
   get '/male', to: "artists#male"
  root to: "artists#index"
end
