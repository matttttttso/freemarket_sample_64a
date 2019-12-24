Rails.application.routes.draw do
  # root
  root to: "show#index"

  # devise
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    delete :sign_out, to: 'devise/sessions#destroy'
    
  end
  

  # show_controller
  resources :show do
    collection do
      get 'detail_content'
      get 'creditcard-registration'
    end
  end

  # signup_controller
  resources :signup, only: [:index, :create] do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      # get 'step4' クレジットカードの登録は購入機能作成の際に同時に行う
      get 'done'
    end
  end

  # user_controller
  resource :users, only: :index do
    collection do
      get 'mypage'
      get 'profile'
      get 'identity'
      get 'logout'
    end
  end

  # card_controller
  resources :card, only: [:new, :show] do
    collection do
      get 'confirmation', to: 'card#confirmation'
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end


  # items_controller
  resources :items do
    collection do
      get 'sell'
      get 'purchase'
    end
    
    resources :purchase, only: [:index] do
      collection do
        get 'index', to: 'purchase#index'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end
end
