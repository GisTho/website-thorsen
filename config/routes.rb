Rails.application.routes.draw do
  root 'pages#home'

  get 'about' => 'pages#about'
  get 'projects' => 'pages#projects'

  get "*path", to: redirect('/')
end
