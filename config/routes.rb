Rails.application.routes.draw do

  resources :stations, except: [:new, :edit]
  resources :sessions, :only => [:create, :destroy]
  resources :trips, except: [:new, :edit]
  resources :users, except: [:new, :edit]
end
