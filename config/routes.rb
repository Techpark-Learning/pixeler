# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for(:users)
  namespace :portfolio do 
    resources :art_items 
  end
  root to: "pages#index"
end
