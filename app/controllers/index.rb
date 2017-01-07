enable :sessions

#Método get de ruta raíz
get '/' do
  erb :index
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/welcome' do
  @all_questions = Question.all.shuffle
  erb :welcome
end  

# Toma los datos de registro
post '/register' do
  @message = ''
  #Valida si el usuario no se ha registrado antes
  if does_user_exist?(params[:email]) == true
    @message = 'Username already exists'
    return erb :login_status
  end
  newbie = User.create(name: params[:user_name], email: params[:email], password:  params[:password])
  @message = 'You have sucessfully registered!'
  erb :login_status
end

# login action
post '/login' do
  # Establece el password
  password = params[:password]
  @message = ''
  if does_user_exist?(params[:email]) == false
    @message = 'Sorry... but that username does not exist.'
    return erb :login_status
  else 
    # Encuentra al usuario
    user = User.find_by(email: params[:email])
    #Valida al ususario
    valid_user = User.authenticate(user.email, password)
    if valid_user
      # user.password_hash == BCrypt::Engine.hash_secret(pwd, user.password_salt)
      @message = 'You have been logged in successfully'
      #Genera la sesion del usuario
      session[:user_id] = user.id
      redirect to '/welcome'      
    else
      @message = 'Sorry but your password does not match.'
      return erb :login_status
    end
  end
end

# check and see if a user exists?
def does_user_exist?(email)
  user = User.find_by(email: email)
  if user
    return true
  else
    return false
  end
end

