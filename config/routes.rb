Rails.application.routes.draw do

  root 'static_pages#home'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'help' => 'static_pages#help'

  get 'profile', to: 'mutants#show'

  resources :teams do
    resources :mutants
    resources :tasks
  end
  resources :mutants do
    resources :teams
    resources :tasks
  end
  resources :tasks do
    resources :mutants
    resources :team
  end
end
