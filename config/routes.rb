ActionController::Routing::Routes.draw do |map|
  map.resources :testsuites do |testsuite|
    testsuite.resources :testcases do |testcase|
      testcase.resources :testcase_results
    end
  end

  map.resources :testcases

  map.resources :tags

  map.root :controller => "testcases", :action => "index"

  map.resources :teststep_results

  map.resources :testcase_results
 
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
