Rails.application.routes.draw do
  root 'pages#home'

  get "*path", to: redirect('/')
end
