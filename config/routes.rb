Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations' }
  root 'mains#index', as: 'home'
  get 'search' => 'personal/peopls#search', :as => 'search_page'
  get 'searchsert' => 'personal/serts#searchsert', :as => 'search_sert_page'
  get 'serchprof' => 'personal/profs#serchprof', :as => 'search_prof_page'
  get 'searchcut' => 'mining/cuts#searchcut', :as => 'search_cut_page'
  get 'searchwell' => 'mining/wells#searchwell', :as => 'search_well_page'
  get 'searchexpl' => 'mining/explosives#searchexpl', :as => 'search_expl_page'
  get 'searchwork' => 'mining/works#searchwork', :as => 'search_work_page'
  get 'searchpeoplall' => 'personal/allpeopls#searchpeoplall', :as => 'search_allpeople_page'
  get 'searchstore' => 'supply/storehouses#searchstore', :as => 'search_stor_page'
  get 'searchrequ' => 'supply/requirements#searchrequ', :as => 'search_requ_page'
  get 'searchcontr' => 'supply/contracts#searchcontr', :as => 'search_contr_page'
  get 'searchdeli' => 'supply/deliveries#searchdeli', :as => 'search_deli_page'
  get 'search_between' => 'mining/works#search_between', :as => 'search_between_page'
  get 'search_between2' => 'supply/deliveries#search_between2', :as => 'search_between2_page'
  resources :users
  resources :searchs
  namespace :admin do
    resources :peopls, except: [:index]
    resources :profs, except: [:index]
    resources :serts, except: [:index]
    resources :wells,  except: [:index]
    resources :explosives,  except: [:index]
    resources :cuts, except: [:index]
    resources :organisations, except: [:index]
    resources :requirements,except: [:index]
    resources :storehouses,except: [:index]
  end
   namespace :personal do
      resources :allpeopls do
        collection {post :import}  
      end
      resources :peopls do
        collection {post :import}  
      end
      resources :profs, only: [:index]
      resources :serts, only: [:index]
   end
   namespace :mining do
      resources :works do
        collection {post :import}
      end
      resources :wells,  only: [:index]
      resources :explosives,  only: [:index]
      resources :cuts, only: [:index]
  end
    namespace :supply do
      resources :organisations, only: [:index]
      resources :contracts
      resources :requirements,only: [:index]
      resources :storehouses,only: [:index]
      resources :deliveries do
          collection {post :import}
        end
  end
end