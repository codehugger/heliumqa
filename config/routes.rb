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

  mount Shrine.download_endpoint => "/files"

  resources :analysis_responses
  resources :analyses do
    resources :analysis_requests, shallow: true
  end
  resources :scan_protocols do
    resources :scan_protocol_matchers, shallow: true
    member do
      post :delete_specifications_file
      post :delete_analysis_options_file
    end
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

  resources :phantom_module_files

  resources :equipment
  resources :accounts
  resources :reports

  resources :scan_series do
    member do
      get :download_files
    end
  end

  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      resources :accounts, only: [:index, :show]
      resources :auth, only: [:create], controller: "authentication"
      resources :analysis_requests do
        resource :analysis_responses, shallow: true
      end
    end
  end

  root to: 'qa_sessions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
