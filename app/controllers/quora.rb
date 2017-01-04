#Metodo que muestra la pregunta seleccionada por el usuario
get '/question/:question.id/:user.id' do 
  p params
  

end   

#Manda a la vista donde el usuario puede preguntar
get '/ask/:id' do 
  @user = User.find(params[:id])
  erb :ask
end

#Muestra todas las preguntas con 0 respuestas
get '/answer/:id' do 
  @user = User.find(params[:id])
  @questions = Question.all.shuffle
  @no_answer_questions = []
  @questions.each do |question|
    @no_answer_questions << question if question.answers.count == 0
  end 
  @no_answer_questions
  erb :answer
end

get '/write_answer/:id/:question_id' do
  @user = User.find(params[:id])
  question = Question.find(params[:question_id])
  answer = Answer.create(question_id: question.id, user_id: @user_id, answer_sentence: "Gucci") 

p "____" * 50
p params
p "____" * 50

end  






#Crea la nueva pregunta
post '/create_question/:id' do 
 topic = Topic.find_by(name: params[:topics])
 question = Question.create(topic_id: topic.id, user_id: params[:id], question_sentence: params[:ask])
 current_user = User.find(params[:id])
 redirect to '/welcome'
end  




get '/a' do 
p "____" * 50
p params
p "____" * 50
end
