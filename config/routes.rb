Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root 'home#index' # トップページを設定（後で作成）
end
