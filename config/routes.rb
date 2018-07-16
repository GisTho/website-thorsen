Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: "registrations", sessions: "sessions"}
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    delete "logout", to: "devise/sessions#destroy"
  end

  resources :projects

  root "pages#home"
  get "about" => "pages#about"
  get "*path", to: redirect("/")
end
