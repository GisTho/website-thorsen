Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: "registrations", sessions: "sessions"}
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    delete "logout", to: "devise/sessions#destroy"
  end

  resources :projects do
    get "add_picture", to: "projects#add_picture"
  end
  resources :pictures
  resources :descriptions

  root "pages#home"
  get "about" => "pages#about"
  get "*path", to: redirect("/")
end
