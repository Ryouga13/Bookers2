Rails.application.routes.draw do


  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources: books, only:[:new, :index, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end