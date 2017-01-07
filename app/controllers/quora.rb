#GETS  -----------------
#Metodo que muestra la pregunta seleccionada por el usuario
get '/question/:question_id' do 
 @question = Question.find(params[:question_id])
 erb :show_question
end   

#Manda a la vista donde el usuario puede preguntar
get '/ask' do 
  erb :ask
end

#Muestra todas las preguntas con 0 respuestas
get '/answer' do 
  @questions = Question.all.shuffle
  @no_answer_questions = []
  @questions.each do |question|
    @no_answer_questions << question if question.answers.count == 0
  end 
  @no_answer_questions
  erb :answer
end

#Manda la pregunta a la vista en la que se esribe la respuesta
get '/write_answer/:question_id' do
  @question = Question.find(params[:question_id])
  erb :answer_question
end  

#Manda a la vista del profile
get '/profile' do 
 questions_made_by_user 
 answers_made_by_user 
 likes_given_by_user  
 dislkes_given_by_user
 erb :profile
end 

#Manda a la vista para actualizar la información del usuario
get '/update_info' do 
 erb :profile_update
end  

#Manda mensaje al usuario sobre la actualización de su info
get '/status_update' do 
  erb :update_status
end  

#Genera un voto positivo para la pregunta seleccionada 
get '/like/:question_id' do 
  valid_vote = validate_vote("q",params[:question_id]) 
  if valid_vote == true  
    new_like = QuestionVote.create(question_id: params[:question_id], user_id: current_user.id, positive: 1)
  end 
  @all_questions = Question.all.shuffle
  erb :welcome
end  

#Genera un voto negativo para la pregunta seleccionada por el usuario 
get '/dislike/:question_id' do 
  valid_vote = validate_vote("q",params[:question_id]) 
  if valid_vote == true  
    new_dislike = QuestionVote.create(question_id: params[:question_id], user_id: current_user.id, negative: 1)
  end 
  @all_questions = Question.all.shuffle
  erb :welcome
end 

 #Genera un voto positivo para la respuesta seleccionada por el usuario 
get '/like_answer/:answer_id' do 
  valid_vote = validate_vote("a",params[:answer_id]) 
  if valid_vote == true  
    new_like = AnswerVote.create(answer_id: params[:answer_id], user_id: current_user.id, positive: 1)
  end 
  @all_questions = Question.all.shuffle
  erb :welcome
end  

#Genera un voto negativo para la respuesta seleccionada por el usuario 
get '/dislike_answer/:answer_id' do 
  valid_vote = validate_vote("a",params[:answer_id]) 
  if valid_vote == true  
    new_dislike = AnswerVote.create(answer_id: params[:answer_id], user_id: current_user.id, negative: 1)
  end 
  @all_questions = Question.all.shuffle
  erb :welcome
end 

#POST -----------------


#Crea la nueva pregunta
post '/create_question' do 
 topic = Topic.find_by(name: params[:topics])
 question = Question.create(topic_id: topic.id, user_id: params[:id], question_sentence: params[:ask])
 redirect to '/welcome'
end 

#Obtiene la respuesta del usuario y la ingresa en la base de datos
post '/new_answer/:question_id' do 
  Answer.create(question_id: params[:question_id] , user_id: current_user.id, answer_sentence: params[:sentence])
  redirect to '/welcome'
end  

#Actualiza los datos del usuario 
post '/update_profile' do 
  update_mesage = validate_email(params[:new_email])
  if params[:name] != "" 
    current_user.update_attributes(name: params[:new_name])
    session[:name_message] = "Tu nombre se ha cambiado correctamente"
  end   
  if @update_mesage == "" && params[:email] != ""   
    current_user.update_attributes(email: params[:new_email]) 
    session[:update_message] = "Tu correo se ha cambiado correctamente"
  end   
  if params[:password] != ""
    current_user.update_attributes(password: params[:new_password]) 
    session[:password_message] = "Tu password se ha cambiado correctamente"
  end   
  if params[:employment] != ""
    current_user.update_attributes(employment: params[:new_employment]) 
    session[:employment_message] = "Tu empleo se ha cambiado correctamente"
  end   
  if params[:education] != ""
    current_user.update_attributes(education: params[:new_education]) 
    session[:education_message] = "Tu educación se ha cambiado correctamente"
  end   
  if params[:location] != ""
    current_user.update_attributes(location: params[:new_location]) 
    session[:ubication_message] = "Tu ubicación se ha cambiado correctamente"
  end 
  redirect to "/status_update"
end   

#METHODS -----------------

#Valida que cuando el email se actualice este no exista previamente en la base
def validate_email(email)
  user_already_exist = User.find_by(email: email)
  if user_already_exist 
    update_message = "Ese correo ya esta asociado a otra cuenta, elige un nuevo correo"
  else
    update_message = "" 
  end
  update_message 
end  

#Actualiza el numero de preguntas hechas por un usuario
def questions_made_by_user 
  questions = current_user.questions.count
  current_user.update_attributes(number_of_questions: questions)
end  
#Actualiza el numero de respuestas de un usuario
def answers_made_by_user 
  answers = current_user.answers.count
  current_user.update_attributes(number_of_answers: answers)
end

#Valida que solo haya un voto por usuario para cada pregunta o respuesta
def validate_vote(type, id) 
  valid_vote = false
  if type == "q" 
    puts "entra a questions"
    votes = QuestionVote.where(question_id: id)
    votes.each do |vote|
      if vote.user_id == current_user.id 
        valid_vote = false
      else
        valid_vote = true
      end 
    end 
    valid_vote
 elsif type == "a" 
    puts "entre a answers"
    votes = AnswerVote.where(answer_id: id)
    votes.each do |vote|
      if vote.user_id == current_user.id 
        valid_vote = false
      else
        valid_vote = true
      end 
    end 
    valid_vote
  end 
end 


#Actualiza el numero de likes de un usuario
def likes_given_by_user 
  user_likes = 0 
  likes_for_answers = AnswerVote.where(user_id: current_user.id)
  likes_for_questions = QuestionVote.where(user_id: current_user.id)  
  
  likes_for_answers.each do |like|
    if like.positive == 1
      user_likes += 1 
    end  
  end

  likes_for_questions.each do |like|
    if like.positive == 1
      user_likes += 1
    end  
  end 
  user_likes   
end

#Actualiza el numero de dislikes de un usuario
def dislkes_given_by_user
  user_dislikes = 0 
  dislikes_for_answers = AnswerVote.where(user_id: current_user.id)
  dislikes_for_questions = QuestionVote.where(user_id: current_user.id)  
  
  dislikes_for_answers.each do |dislike|
    if dislike.negative == 1
      user_dislikes += 1 
    end  
  end

  dislikes_for_questions.each do |dislike|
    if dislike.negative == 1
      user_dislikes += 1
    end  
  end 
  user_dislikes   
end  




get '/a' do 
p "____" * 50
p params
p "____" * 50
end
