Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "documents#index"

  resources :documents, only: %i[index show new create edit update]
end
