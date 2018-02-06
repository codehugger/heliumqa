Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :inspections
    resources :accounts
    resources :analyses
    resources :analysis_requests
    resources :analysis_request_files
    resources :analysis_responses
    resources :analysis_response_files
    resources :equipment
    resources :equipment_profiles
    resources :inspection_files
    resources :sites

    root to: "users#index"
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
  resources :analysis_requests
  resources :analyses
  resources :equipment_profiles

  resources :inspections do
    member do
      get :download_files
      post :reprofile_files
    end
    resources :inspection_files, shallow: true
    resources :analyses, shallow: true
  end

  resources :inspection_files, except: [:new, :create]
  resources :equipment
  resources :sites
  resources :accounts
  resources :reports

  root to: 'inspections#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
