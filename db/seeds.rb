# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create!(tweetname: "Imposter",
#           img_url: "https://xboxplay.games/uploadStream/10884.jpg"
#           )   


link_array = ['https://xboxplay.games/uploadStream/10884.jpg',
                'https://i.pinimg.com/originals/70/eb/59/70eb59d95d0a34060c6f89411e0f4b24.png',
                'https://cdn.bfldr.com/SH6M70M3/as/qnfcfpm9w79b3mq8942k4tqz/geminipng_by_Among_Us_Avatar_Maker.jpg?quality=85',
                'https://i.pinimg.com/originals/7a/b6/29/7ab629864f4c63ec9ea594b16ffe4008.jpg',
                'https://i.etsystatic.com/24883593/r/il/b3330d/2575218658/il_570xN.2575218658_a9vp.jpg',
                'https://i.pinimg.com/originals/8f/fe/76/8ffe766d3ec697b72a340a282cf5b02e.jpg',
                'https://i.pinimg.com/originals/38/46/7e/38467ec0bd750ad3afadd0f6ff59f3b4.jpg',
                'https://i.pinimg.com/originals/2a/9c/f4/2a9cf4b9465667b087a2af437487a53a.jpg',
                'https://i.pinimg.com/originals/0e/53/f0/0e53f062b36ce92d0afc099015d9537d.jpg'
]


13.times do |n|
    tweetname = Faker::Name.name
    img_url = link_array.sample
    User.create!(tweetname: tweetname,
                 img_url: img_url
    )
end

content_array = [Faker::Quote.yoda, Faker::Quote.famous_last_words, Faker::Quote.fortune_cookie,Faker::Quotes::Shakespeare.hamlet]
users = User.order(:created_at).take(6)
10.times do
    users.each { |user| user.tweets.create!(content: content_array.sample)}
end

users = User.all
user = users.first
following = users[2..9]
followers = users[4..11]
following.each{ |followed| user.follow(followed)}
followers.each{ |follower| follower.follow(user)}