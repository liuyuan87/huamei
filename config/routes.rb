Huamei::Application.routes.draw do
  
  root 'start#index'
  
  get 'not-supported' => 'start#not_supported'
  get 'intro' => 'start#intro'
  get 'case' => 'start#case'
  get 'night' => 'start#night'
  get 'magazine' => 'start#magazine'
  get 'contact' => 'start#contact'
  
  
  get "admin" => "account#login"
  get "account/main"
  get "account/desktop"
  post "admin_login_rst" => "account#login_rst"
  get "admin_logout" => "account#logout"
  
  namespace :admin do
    
    resources :topics
    
    resources :cases do
      member do
        get :s_hot
        get :c_hot
      end
    end
    
    get "sys/index_pics"
    post "sys/index_pics"
    
    get "sys/index_pics2"
    post "sys/index_pics2"
    
    get "sys/intro_pics"
    post "sys/intro_pics"
    
    get "sys/intro"
    post "sys/intro"
    
    get "db/index"
    
    post "db/backup"
    post "db/restore"
    delete "db/destroy"
    
    get "db/sql"
    post "db/sql"
    
    get "db/tables"
    get "db/structure"
    post "db/export_sql"
    
    get "run_logs/index"
    post "run_logs/index"
    get "run_logs/clear"
    resources :run_logs
    
    resources :admins
  end
  
  namespace :kindeditor do
    post "/upload" => "assets#create"
    get  "/filemanager" => "assets#list"
  end
  
  post "upload_asset" => "assets#create"
  get "file_manager_json" => "assets#list"
  
  
  get "*path" => "application#render_not_found"

end
