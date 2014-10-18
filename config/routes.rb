Rails.application.routes.draw do

    root 'reader#index'

    get '/newuser' => 'users#new'
    post '/newuser' => 'users#create'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'

    get '/logout' => 'sessions#destroy'

    get '/reader' => 'reader#index'
    post '/reader' => 'reader#parse'

    get '/save' => 'reader#save'
    post '/save' => 'reader#save'


    get '/delete' => 'reader#delete'

    # Goes to Library home where all saved
    # articles are available for viewing
    get '/library' => 'library#home'

    # Goes to reading page in library where
    # saved articles are recalled for reading
    get '/library/read' => 'library#read'

    # Adding comments here
    # More comments

end