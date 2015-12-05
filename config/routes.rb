Rails.application.routes.draw do

  resources :stations, except: [:new, :edit]
  resources :users, except: [:new, :edit] do
  	resources :trips, except: [:new, :edit]
  end
  
end
