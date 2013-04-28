Masterit::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  scope :module => :web do
    root to: 'pages#index'
    resource :session
    resources :subscribers

    resources :courses, only: [:show]

    namespace :admin do
      root :to => 'dashboard#index'

      resources :settings
      resources :users
      resources :pages
      resources :subscribers
      resources :courses

      resources :menus do
        scope module: :menu do
          resources :items
        end
      end
    end

    match '/(:id)' => 'pages#show', as: 'show_page'
  end
end
