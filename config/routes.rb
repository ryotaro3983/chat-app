Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do          # ←ルーティングのネスト
    resources :messages, only: [:index, :create]     #どのルームで投稿されたメッセなのかをパスから判断できるようにする
  end
end
