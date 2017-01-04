u1 = User.create(name: "Ela", email: "ela@mail.com", password: "123")
u2 = User.create(name: "Lorena", email: "lorena@mail.com", password: "123")  
u3 = User.create(name: "Sebas", email: "sebas@mail.com", password: "123")
u4 = User.create(name: "Adan", email: "adan@mail.com", password: "123")

t1 = Topic.create(name: "Moda")
t2 = Topic.create(name: "Cine")

ut1 = UserTopic.create(user_id: u1.id ,topic_id: t1.id)
ut1 = UserTopic.create(user_id: u1.id ,topic_id: t2.id)
ut1 = UserTopic.create(user_id: u2.id ,topic_id: t1.id)
ut1 = UserTopic.create(user_id: u2.id ,topic_id: t2.id)
ut1 = UserTopic.create(user_id: u3.id ,topic_id: t1.id)
ut1 = UserTopic.create(user_id: u3.id ,topic_id: t2.id)
ut1 = UserTopic.create(user_id: u4.id ,topic_id: t1.id)
ut1 = UserTopic.create(user_id: u4.id ,topic_id: t2.id)

q1 = Question.create(topic_id: t1.id, user_id: u1.id, question_sentence: "¿Cual es el mejor diseñador?") 
q2 = Question.create(topic_id: t1.id, user_id: u2.id, question_sentence: "¿Que color le va mas a la piel morena?")
q3 = Question.create(topic_id: t1.id, user_id: u3.id, question_sentence: "¿Cuál es el mejor tipo de zapato para user un traje?")
q4 = Question.create(topic_id: t1.id, user_id: u4.id, question_sentence: "¿Cual es el largo optimo de un pantalón?")
q5 = Question.create(topic_id: t2.id, user_id: u1.id, question_sentence: "¿Quien es el mejor director de foto?") 
q6 = Question.create(topic_id: t2.id, user_id: u2.id, question_sentence: "¿Que tipo de iluminación es la mas fácil de trabajar?")
q7 = Question.create(topic_id: t2.id, user_id: u3.id, question_sentence: "¿Cuál es la mejor pelicula que han visto?")
q8 = Question.create(topic_id: t2.id, user_id: u4.id, question_sentence: "¿Cuál deberia ser el criterio para nominar al mejor actor?")

a1 = Answer.create(question_id: q1.id, user_id: u2.id, answer_sentence: "Gucci")
a2 = Answer.create(question_id: q1.id, user_id: u3.id, answer_sentence: "Valentino")
a3 = Answer.create(question_id: q2.id, user_id: u4.id, answer_sentence: "Verde")
a4 = Answer.create(question_id: q2.id, user_id: u1.id, answer_sentence: "Amarillo")
a5 = Answer.create(question_id: q3.id, user_id: u1.id, answer_sentence: "Todos menos deportivo")
a6 = Answer.create(question_id: q3.id, user_id: u2.id, answer_sentence: "El que sea le va bien mientras termine en punta")
a7 = Answer.create(question_id: q4.id, user_id: u3.id, answer_sentence: "Debe llegar al tobillo")
a8 = Answer.create(question_id: q4.id, user_id: u1.id, answer_sentence: "Depende el tipo de pantalon")
a9 = Answer.create(question_id: q5.id, user_id: u4.id, answer_sentence: "No cnozoco ninguno")
a10 = Answer.create(question_id: q5.id, user_id: u3.id, answer_sentence: "Lubezki")
a11 = Answer.create(question_id: q6.id, user_id: u1.id, answer_sentence: "La luz natural de dia pero siempre y cuando no sea entre las 12 y las 4 del dia")
a12 = Answer.create(question_id: q6.id, user_id: u4.id, answer_sentence: "La de estudio tu la controlas por completo")
a13 = Answer.create(question_id: q7.id, user_id: u1.id, answer_sentence: "Megamente")
a14 = Answer.create(question_id: q7.id, user_id: u4.id, answer_sentence: "Up")
a15 = Answer.create(question_id: q8.id, user_id: u1.id, answer_sentence: "Las emopciones que genera")
a16 = Answer.create(question_id: q8.id, user_id: u2.id, answer_sentence: "En la credibilidad que le da al papel que debe desempñear")

qv1 = QuestionVote.create(question_id: q8.id, user_id: u2.id, positive: 1)
qv2 = QuestionVote.create(question_id: q7.id, user_id: u2.id, positive: 1)
qv3 = QuestionVote.create(question_id: q6.id, user_id: u2.id, positive: 1)
qv4 = QuestionVote.create(question_id: q5.id, user_id: u2.id, positive: 1)
qv5 = QuestionVote.create(question_id: q1.id, user_id: u1.id, negative: 1)
qv6 = QuestionVote.create(question_id: q2.id, user_id: u1.id, negative: 1)
qv7 = QuestionVote.create(question_id: q3.id, user_id: u1.id, negative: 1)
qv8 = QuestionVote.create(question_id: q4.id, user_id: u1.id, negative: 1)


av1 = AnswerVote.create(answer_id: a1.id, user_id: u3.id, positive: 1)
av2 = AnswerVote.create(answer_id: a4.id, user_id: u3.id, positive: 1)
av3 = AnswerVote.create(answer_id: a3.id, user_id: u3.id, positive: 1)
av4 = AnswerVote.create(answer_id: a5.id, user_id: u3.id, positive: 1)
av5 = AnswerVote.create(answer_id: a16.id, user_id: u4.id, negative: 1)
av6 = AnswerVote.create(answer_id: a15.id, user_id: u4.id, negative: 1)
av7 = AnswerVote.create(answer_id: a13.id, user_id: u4.id, negative: 1)
av8 = AnswerVote.create(answer_id: a11.id, user_id: u4.id, negative: 1)







