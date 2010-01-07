ActionController::Routing::Routes.draw do |map|
  map.root :controller => "testcases", :action => "index"

  map.resources :teststep_results

  map.resources :testcase_results

  map.resources :testcases
  
  map.connect 'testcases/:testcase_id/results/new', controller: 'testcase_results', action: 'new'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
