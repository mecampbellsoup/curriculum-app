Assignmentio::Application.routes.draw do

  constraints Subdomain do

    resources :assignments do
      resources :submissions
    end
    resources :submissions do
      resources :feedbacks, :controller => 'feedback'
    end

    namespace :api do
      namespace :v1 do
        resources :assignments
      end
    end


    get "/assignments/:assignment_id/submissions/download.zip" => 'submissions#download_all_submissions', as: "download_all"
   
    get "/user/:id/submissions/all" => "user_assignments#index", as: "user_assignment_submissions"
    get "/api/info" => "api/v1/assignments#help", as: "api_helper"

    resources :groups

    get "/assignments/:id/students/new" => 'assignments#add_student', as: "add_student"
    get "/reminder/:id" => 'user_assignments#reminder', as: "reminder"

    get "/users/:id" => 'users#show', as: "user"
    get "/users/:id/edit" => "users#edit", as: "useredit"
    put "/users/:id" => "users#update"
    get "/users(.:format)" => 'users#index'

    match '', to: 'sessions#new'
    get "/organization/edit" => "organizations#edit", :as => "edit_organization"
    post "/organization/edit" => "organizations#update", :as => "edit_organization"

  end


  get "/login" => 'sessions#new', as: "new_session"
  get "/logout" => 'sessions#destroy'
  get "/signup" => "users#new", as: "signup"
  post "/signup" => "users#create"
  post "/sessions" => 'sessions#create'

  root :to => 'sessions#new'
  

end
