DevMonitor::Application.routes.draw do
  root :to => 'boris#index', :as => :boris_index

  post '/boris/:name/start', :to => 'boris#start', :as => :boris_start
  post '/boris/:name/stop', :to => 'boris#stop', :as => :boris_stop

  resources :boris, :path => "/", :only => [:index, :create]
end
