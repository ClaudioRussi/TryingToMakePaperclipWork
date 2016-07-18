Rails.application.routes.draw do

concern :commentable do 
  resources :comments
end
get 'welcome/index'
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
root 'welcome#index'
  
get 'adoption/p/:id' => 'posts#adoption', as: :adoption
get 'found/p/:id' => 'posts#found', as: :found
get 'missing/p/:id' => 'posts#missing', as: :missing
  
post 'login' => 'session#login'
get 'logout'=> 'session#logout'
  
resources :users, except:[:edit, :update]
get 'user/edit'=> 'users#edit'
patch 'user/update'=> 'users#update'
get 'mps'=> 'users#messages'
  
resources :posts, concerns: :commentable

resources :memes, except:[:index], concerns: :commentable
get 'moderation' => 'memes#moderation'
post 'vote' => 'memes#vote', as: :vote
get 'meme/p/:id' => 'memes#index', as: :meme_list

get 'mp/:id' => 'messages#new', as: :mp
get 'messages' => 'messages#show'
post 'messages' => 'messages#create'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
