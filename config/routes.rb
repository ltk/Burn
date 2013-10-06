Burn::Application.routes.draw do
  resource :account, :only => [:new, :create, :show, :update]

  resources :burners
  resources :email_addresses
  resources :inbound_messages, :only => [:create]

  get  'sign_in'  => 'sessions#new'
  post 'sign_in'  => 'sessions#create'
  get  'sign_out' => 'sessions#destroy'

  root :to => 'accounts#new', :via => :get

  unless Rails.env.development?
    match '*path', :via => :all, :to => 'application#render_404'
  end
end
