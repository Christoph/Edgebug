ActionController::Routing::Routes.draw do |map|
  map.root :controller => "testcases", :action => "index"

  map.resources :teststep_results

  map.resources :testcase_results

  map.resources :testcases, :has_many => :testcase_results
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
