ActionController::Routing::Routes.draw do |map|
  map.sign_in 'sign_in', :controller => :user_sessions, :action => 'new'
  map.sign_out 'sign_out', :controller => :user_sessions, :action => 'destroy'
  map.resource :user_session
  map.resources :users,
    :collection => { 
      :request_password_reset   => [:get, :post],
      :resend_activation        => :get
    },
    :member     => { :reset_password          => [:get, :put] }
  map.activate '/activate/:activation_code', :controller => 'activations', :action => 'create'
  map.root :controller => 'mychess', :action => 'play'
end
