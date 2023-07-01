Rails.application.routes.draw do
  scope module: :api do
    resources :countries
  end

  root "dashboards#index"
end
