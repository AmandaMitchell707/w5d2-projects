# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do 
  
  User.destroy_all
  Sub.destroy_all
  Post.destroy_all
  PostSub.destroy_all
  
  austin = User.create!(username: 'atar97', password: 'starwars')
  amanda = User.create!(username: 'amandashow', password: 'starwars')
  
  baby_animals = Sub.create!(title: 'Baby Animals', description: 'The cutest tiny animals around', moderator_id: amanda.id)
  squids = Sub.create!(title: 'Cephalopods', description: 'Ghostface Killas of the Sea', moderator_id: austin.id)
  
  posts = Post.create!([
    {title: 'squid1', author_id: amanda.id, content: 'content'},
    {title: 'squid2', author_id: austin.id, content: 'content'},
    {title: 'Lamb', author_id: amanda.id, content: 'content'},
    {title: 'Baby Octopus', author_id: austin.id, content: 'content'}
    ])
    
  
  sub_post_connections = PostSub.create!([
    {sub_id: squids.id, post_id: posts[0].id},
    {sub_id: squids.id, post_id: posts[1].id},
    {sub_id: baby_animals.id, post_id: posts[2].id},
    {sub_id: baby_animals.id, post_id: posts[3].id},
    {sub_id: squids.id, post_id: posts[3].id}
    ])
end 