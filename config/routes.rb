Rails.application.routes.draw do

 post "bugs/assign_bug"
 post "bugs/mark_bug"

 resources:sheets
 resources:bugs
 resources:projects


  root 'projects#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
