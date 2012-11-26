GrandesVillas::Application.routes.draw do
  resources :destinations

  mount Ckeditor::Engine => '/ckeditor'

  #scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    resources :costa_tropicals

    match '/about',   to: 'static_pages#about'
    match '/contact', to: 'messages#new'
    match '/owner', to: 'static_pages#owner'
  match '/services', to: 'static_pages#services'

    resources :villas
  resources :photos

  resources :shared

    resources :messages

    root :to => 'home#index'

    get 'signup', to: 'users#new', as: 'signup'
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
