Masterit::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  scope :module => :web do
    root to: 'pages#index'
    resource :session
    resources :subscribers

    namespace :admin do
      root :to => 'dashboard#index'

      resources :settings
      resources :users
      resources :pages
      resources :subscribers
      resources :menus do
        resources :menu_items
      end
    end

    match '/(:slug)' => 'pages#show', as: 'show_page'
  end
end
