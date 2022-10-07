# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
    path: "api/v1",
    controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations",
      passwords: "users/passwords"
    },
    path_names: {
      sign_in: "/login",
      password: "/forgot",
      sign_out: "/logout",
      registration: "/register"
    }
  root "application#index"

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      root "dashboard#index"
    end
  end
end
