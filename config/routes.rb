ActionController::Routing::Routes.draw do |map|
  map.sign_in 'sign_in', :controller => :user_sessions, :action => 'new'
  map.sign_out 'sign_out', :controller => :user_sessions, :action => 'destroy'
  map.resource :user_session
  map.resource :account, :controller => :users
  map.resources :users
  map.root :controller => 'mychess', :action => 'play'
end
