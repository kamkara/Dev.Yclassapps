Rails.application.routes.draw do
  resources :exercises
  resources :courses
  resources :citytowns
  resources :schools
  resources :materials
  resources :levels

  ##################### START Membership #####################
  ##################### END Membership #######################
  ##################### START Course #####################

   resources :courses do
    resources :exercises, except: [:index, :show]
  end
  ##################### END Course #######################
  
  ##################### START Course #####################
  #get "feed", to:"courses#index"
  get "show-course", to:"courses#show"
  get "new-course", to:"courses#new"

  ##################### END Course #######################

  
  ##################### START Membership #####################
  get "teacher-sign-up" , to:'membership#teacherUp'
  get "teacher-sign-in" , to:'membership#teacherIn'
  get "ambassadeur-sign-up" , to:'membership#ambassadorUp'
  get "ambassadeur-sign-in" , to:'membership#ambassadorIn'
  get "team-sign-up" , to:'membership#teamUp'
  get "team-sign-in" , to:'membership#teamIn'
  ##################### END Membership #######################

  
  ##################### START Dashboard #####################
  get "dashboard", to:'dashboard#index'
  get "setting", to:'dashboard#home'
  get "new-materials", to:"materials#new"
  get "new-levels", to:"levels#new"
  get "new-city", to:"citytowns#new"
  get "new-school", to:"schools#new"

  ##################### END Dashboard #######################
  
  
  ##################### START Membership #####################
  
  devise_scope :user do
    get 'student-sign-in', to: 'devise/sessions#new'
    get 'student-sign-up', to: 'devise/registrations#new', as: "new_user_registration"
    delete 'deconnecter',  to: "devise/sessions#destroy", as: "destroy_user_session_path"
  end
  
  devise_for :users
  
  ##################### END Membership #######################
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homepage#index"
end
