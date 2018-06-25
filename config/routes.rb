Rails.application.routes.draw do
  root 'pages#home'

  resources :projects

  get 'about' => 'pages#about'

  get "*path", to: redirect('/')
end
