Rails.application.routes.draw do

  root 'places#index'

  get '/places/new' => 'places#new', :as => 'new_place'
  post 'places' => 'places#create'

  get '/places' => 'places#index'
  get '/places/:id' => 'places#show', :as => 'place'

  get '/places/:id/edit' => 'places#edit', :as => 'edit_place'
  patch '/places/:id' => 'places#update'

  delete '/places/:id' => 'places#delete'

  get '/reviews/:place_id/submit_new'  => 'reviews#create'

end
