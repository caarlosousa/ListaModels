# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categorias = Category.create([{id: 1, name: "Filmes", description: "Melhor local para filmes"},
    {id: 2, name: "Esportes", description: "Acompanhe o futebol do botafogo"}, 
    {id: 3, name: "Lives", description: "Veja as melhores lives aqui"}])
   
posts = Post.create([{id: 1, title: "Luis Castro", content: "A crise do fogao"},
    {id: 2, title: "Novo lider", content: "Parece pintar ai o novo campeao do brasileirao 2023"},
    {id: 3, title: "Caze", content: "Vem ai, os gols da rodada."}])
   
feedbacks = Feedback.create([{like: true, post_id: 1}, {like: false, post_id: 1}, {like: true, post_id: 2}, {like: false, post_id: 2}, {like: true, post_id: 3},
    {like: true, post_id: 3}])
   
comentarios = Commentary.create([{content: "Melhor filme do mundo", post_id: 1}, {content: "Representa bem a epoca", post_id: 1},
    {content: "O FOGAO ESTA EMBATIVEL", post_id: 2}, {content: "MATI SEGOVIA, CRAQUE DE BOLA", post_id: 2},
    {content: "METEU ESSA MANE", post_id: 3}, {content: "Ta de brincadeira eeeein"}, post_id: 3])