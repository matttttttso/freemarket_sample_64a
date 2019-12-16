Rails.application.routes.draw do
  devise_for :users
  root to: "show#index"

  resources :signup, only: [:index, :create] do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      # get 'step4' クレジットカードの登録は購入機能作成の際に同時に行う
      get 'done'
    end
  end
end
