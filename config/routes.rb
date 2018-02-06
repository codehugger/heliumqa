Rails.application.routes.draw do

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
