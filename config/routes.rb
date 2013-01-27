GrandesVillas::Application.routes.draw do
  resources :services

  namespace :admin do
    resources :photos
  end

  resources :destinations

  mount Ckeditor::Engine => '/ckeditor'

  namespace :ckeditor, :only => [:index, :create, :destroy] do
    resources :pictures
    resources :attachment_files
  end

  #scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    resources :costa_tropicals

    match '/about',   to: 'static_pages#about'
    match '/contact', to: 'messages#new'
    match '/owner', to: 'static_pages#owner'
  match '/villas/search/motril', to: 'villas#motril'
  match '/villas/search/salobrena', to: 'villas#salobrena'
  match '/villas/search/almunecar', to: 'villas#almunecar'

    resources :villas do
      collection { post :sort_photos }
      collection { post :search, to: 'villas#index' }
    end
  resources :photos

  resources :shared

    resources :messages, :only => [:new, :create]

    root :to => 'home#index'

    #get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'
    match '/admin', to: 'static_pages#admin'

    resources :users
    resources :sessions
  #end
  #match '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  #match '', to: redirect("/#{I18n.default_locale}")

  ActionDispatch::Routing::Translator.translate_from_file('config/locales/routes.yml')
end
