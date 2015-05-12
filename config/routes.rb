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
    get 'assign/:mutant_id', action: 'assign', :as => 'assign'
    resources :mutants, :only => [:create, :destroy]
    member do
      get :select_mutants, action: :select_mutants, :as => :select_mutants
    end
    resources :tasks, :only => [:new, :edit, :create, :destroy]
  end
  resources :mutants do
    resources :teams, :only => [:create, :destroy]
    get 'assign/:id', controller: :tasks, action: 'assign', :as => 'assign'
    get 'unassign/:id', controller: :tasks, action: 'unassign', :as => 'unassign'
  end
  resources :tasks do
    member do
      get 'step/:step', action: 'step', :as => 'step'
      get :select_mutants, action: :select_mutants, :as => :select_mutants
      get :select_mutants_to_unassign, action: :select_mutants_to_unassign, :as => :select_mutants_to_unassign
    end
  end
end
