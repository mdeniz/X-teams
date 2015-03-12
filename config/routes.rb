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
    resources :mutants, :only => [:create, :destroy]
    resources :tasks, :only => [:new, :edit, :create, :destroy]
  end
  resources :mutants do
    resources :teams, :only => [:create, :destroy]
  end
  resources :tasks do
    member do
      get 'step/:step', action: 'step', :as => 'step'
    end
  end
end
