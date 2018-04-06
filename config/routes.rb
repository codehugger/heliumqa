Rails.application.routes.draw do

  resources :scan_header_tags
  resources :mime_types
  require 'sidekiq/web'
  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'

    namespace :admin do
      resources :accounts
      resources :users
      resources :inspections
      resources :analyses
      resources :analysis_requests
      resources :analysis_request_files
      resources :analysis_responses
      resources :analysis_response_files
      resources :equipment
      resources :scan_protocols
      resources :inspection_files
      resources :sites

      root to: 'accounts#index'
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  mount Shrine.presign_endpoint(:cache) => "/inspection_files/presign", as: 'presign_inspection_files'

  resources :analysis_response_files
  resources :analysis_responses
  resources :analysis_request_files
  resources :analyses do
    resources :analysis_requests, shallow: true
  end
  resources :scan_protocols do
    resources :scan_protocol_matchers, shallow: true
  end
  resources :sites do
    resources :scan_protocols, shallow: true
  end

  resources :inspections do
    member do
      get :download_files
      post :match_scan_protocols
    end
    resources :inspection_files, shallow: true
    resources :analyses, shallow: true
  end

  resources :equipment
  resources :accounts
  resources :reports

  resources :scan_series

  root to: 'inspections#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
