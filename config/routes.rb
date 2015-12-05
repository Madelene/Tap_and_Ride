Rails.application.routes.draw do

  resources :stations, except: [:new, :edit]
  resources :sessions, :only => [:create, :destroy]
  resources :users, except: [:new, :edit] do
  	resources :trips, except: [:new, :edit]
  end
  
end
