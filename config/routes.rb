Rails.application.routes.draw do

  resources :scan_header_tags
  resources :mime_types
  require 'sidekiq/web'

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  mount Shrine.presign_endpoint(:cache) => "/qa_session_files/presign", as: 'presign_qa_session_files'

  resources :analysis_responses
  resources :analyses do
    resources :analysis_requests, shallow: true
  end
  resources :scan_protocols do
    resources :scan_protocol_matchers, shallow: true
  end
  resources :sites do
    resources :scan_protocols, shallow: true
  end

  resources :analysis_requests do
    resources :analysis_responses, shallow: true
  end

  resources :qa_sessions do
    member do
      get :download_files
      post :match_scan_protocols
    end
    resources :qa_session_files, shallow: true
    resources :analysis_sessions, shallow: true
  end

  resources :equipment
  resources :accounts
  resources :reports

  resources :scan_series

  namespace :api do
    namespace :v1 do
      resources :accounts
      resources :auth
    end
  end

  root to: 'qa_sessions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
