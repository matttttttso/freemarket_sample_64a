Rails.application.routes.draw do
  devise_for :users
  root to: "review_users#toppage"

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
