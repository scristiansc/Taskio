[ 'cristian', 'sindry', 'vitto', 'gabriel', 'natalia', 'patricia', 'lucas', 'harry' ].each do |name|
User.create email: "#{name}@taskio.com", password: '123456'
end

puts 'Users has been created'


[ 'desarrollo', 'mercadeo', 'conceptualización', 'ejercicios' ].each do |name|
Category.create name: name, description: '--'
end

puts 'Categories has been created'


owner = User.find_by(email: 'cristian@taskio.com')

[

[ 'conceptualización', 'Bienvenida ', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'conceptualización', '¿Qué es ruby on rails y por qué usarlo?', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'conceptualización', 'Entorno de desarrollo de RoR', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'ejercicios', 'Instalación de Ruby, RoR en windows y Linux', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'conceptualización', 'Entender la web con rieles', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'ejercicios', 'Crear una nueva aplicación RoR ¡Hola Rails!', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'ejercicios', 'Manipular el patrón MVC', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'conceptualización', '¿Qué vamos a desarrollar?', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Crear la base de nuestra aplicación', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Los secretos de rails', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'conceptualización', 'Assets y Layouts', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'conceptualización', 'Diseñar el modelo de datos', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Agregar primer conjunto de scaffolds', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Cómo entender las migraciones', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Esteroides para tu desarrollo - HAML', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Esteroides para tu desarrollo - Simple Form', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Regenerando el primer conjunto de scaffolds', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Internacionalización de tu aplicación', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'conceptualización', 'Esteroides para tu desarrollo - Debugging', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Agregar validaciones de modelo', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Añadiendo el concepto de usuario', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Añadir participantes a la tarea', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'CanCanCan ¿puedes hacerlo?', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Callbacks en Rails', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Enviar email a los participantes', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Añadir comentarios vía AJAX', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'desarrollo', 'Embellecer nuestra aplicación', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'conceptualización', 'Desplegando a Heroku', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ],

[ 'conceptualización', 'Conclusiones del curso', [ 'sindry:1', 'vitto:2', 'gabriel:random' ] ]

].each do |category, description, participant_set|
participants = participant_set.map do |participant|
user_name, raw_role = participant.split(':')

role = raw_role == 'random' ? [ 1, 2 ].sample : raw_role

Participant.new(

user: User.find_by(email: "#{user_name}@taskio.com"),

role: role.to_i

)
end

Task.create!(

category: Category.find_by(name: category),

name: "Tarea ##{Task.count + 1}",

description: description,

due_date: Date.today + 15.days,

owner: owner,

participating_users: participants

)
end

puts 'Tasks has been created'
