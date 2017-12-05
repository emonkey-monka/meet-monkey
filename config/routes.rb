Rails.application.routes.draw do
  get 'gl_pages/home'

  root 'gl_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
