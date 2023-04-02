Rails.application.routes.draw do
  
  get '/school_admins' => 'users#index', :defaults => { role: 'school_admin' }
  get '/students' => 'users#index', :defaults => { role: 'student' }

  # resources :users, only: :index
  resources :schools do
    resources :courses do
      resources :batches do
        member do
          get :pending_enrollment_requests
          get :approved_students
        end
      end
    end
    
  end

  resources :batches, only: [] do
    resources :enrollment_requests do
      put :approve
      put :decline
    end
  end
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'schools#index'
  # root to: 'batches#index', constraints: lambda { |user| user.student? }
  # devise_for :users, controllers: {
  #     passwords: 'users/passwords',
  #     confirmations: 'users/confirmations',
  #     sessions: 'users/sessions',
  #     invitations: 'users/invitations',
  # }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "home#index"
end
