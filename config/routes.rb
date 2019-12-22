Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: "show#index"

  devise_scope :user do
    delete :sign_out, to: 'devise/sessions#destroy'
  end

  resources :signup, only: [:index, :create] do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      # get 'step4' クレジットカードの登録は購入機能作成の際に同時に行う
      get 'done'
      get 'logout'
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      get 'confirmation', to: 'card#confirmation'
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :items, only: [:index, :create] do
    collection do
      get 'sell'
    end
  end

  resource :review_users, :review_items, only: [:index, :show]
  
  resource :review_users do
    collection do
      get 'login'
      get 'signup'
      get 'basic_info'
      get 'phone_num'
      get 'phone_num2'
      get 'address'
      get 'creditcard'
      get 'completion'
      get 'mypage'
      get 'profile'
      get 'identity'
      get 'logout'
    end
  end

  resource :review_items do
    collection do
      get 'sell'
    end
  end
  
end
