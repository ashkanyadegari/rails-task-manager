Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #As a user I can list all tasks
  root to: "tasks#index"

  #As a user I can add a task
  get "/tasks/new", to: "tasks#new", as: :new_task
  post "/tasks", to: "tasks#create"

  #As a user I can view the details of a task
  get "/tasks/:id", to: "tasks#show", as: :task

  #As a user I can edit a task (mark as completed/update title and details)
  get "/tasks/:id/edit", to: "tasks#edit", as: :edit_task
  patch "/tasks/:id", to: "tasks#update"

  #As a user, I can remove a task
  delete "/tasks/:id", to: "tasks#destroy", as: :delete_task

end
