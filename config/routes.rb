DevMonitor::Application.routes.draw do
  root :to => 'boris#index', :as => :boris_index

  resources :boris, :path => "/"
end
