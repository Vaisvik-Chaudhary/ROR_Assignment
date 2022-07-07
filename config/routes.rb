Rails.application.routes.draw do
  resources :companies do
    resources :employees
  end
  root "companies#home"
end
