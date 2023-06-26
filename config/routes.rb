Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      scope 'posts' do
        post 'create', to:'posts#create'
        get 'show/:id', to: 'posts#show'
        get 'index', to: 'posts#index'
        patch 'update/:id', to:'posts#update'
        delete 'delete/:id', to:'posts#delete'
        get ':id/feedbacks/index', to: 'feedbacks#index'
        get ':id/feedbacks/show/:id', to: 'feedbacks#show'
        post ':id/feedbacks/create', to: 'feedbacks#create'
        patch ':id/feedbacks/update/:id', to: 'feedbacks#update'
        delete ':id/feedbacks/delete/:id', to: 'feedbacks#delete'
        get ':id/commentaries/index', to: 'commentaries#index'
        get ':id/commentaries/show/:id', to: 'commentaries#show'
        post ':id/commentaries/create', to: 'commentaries#create'
        patch ':id/commentaries/update/:id', to: 'commentaries#update'
        delete ':id/commentaries/delete/:id', to: 'commentaries#delete'
      end
    end
  end
end
