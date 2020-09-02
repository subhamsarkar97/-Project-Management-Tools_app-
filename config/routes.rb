Rails.application.routes.draw do
    resources :users do
        resources :projects, except: [:index] 
        get "projects", to: 'projects#projects', as: 'projects_profile'
        get "assigned_projects", to: 'projects#assigned_projects', as: 'assigned_project'
    end 
    resources :features do
        resources :comments
        put :savetask, on: :collection
    end
    get "create_project", to: 'users#createproject'
    post "save_in_session", to: 'users#save_in_session'
    get 'auth/signout'
    resources :password_resets, only: [:new, :create, :edit, :update]
    post "task", to:'features#create', as: 'add_task'
    resources :activities
    resources :mentions, only: [:index]
    match 'auth/:provider/callback', to: 'users#callback', via: [:get, :post]
    root 'sessions#index'
    get "welcome", to: 'sessions#welcome'
    post "login", to:'sessions#create'
    get "login", to: 'sessions#new'
    get "authorized", to: 'sessions#page_requires_login'
    delete "welcome", to: 'sessions#destroy'
end
