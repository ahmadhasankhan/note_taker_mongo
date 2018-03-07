Rails.application.routes.draw do
  devise_for :users

  resources :notes do
    collection do
      get 'my_notes'
    end
  end

  root to: 'notes#index'
end
