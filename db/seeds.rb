# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@user1 = UserAccount.create(email: 'someone@email.com', last_name: 'White', first_name: 'Joe')
@user2 = UserAccount.create(email: 'someone.else@email.com', last_name: 'Smith', first_name: 'Mary')
@bdd_user = UserAccount.create(first_name: 'Test', last_name: 'Guy',
            email: 'test@guy.com',
            salt: 'lVBQNHDpMVtfMjySQJNpJZAegadgRLBHaXNAFNtnYSrMPRKxif',
            password_hash: 'db79128ddf7254ba1f000309d50f8e883d2927be80437e8075d0bf84ccdb1f22',
            user_name: 'static')


@recipe1 = Recipe.create(recipe_name: 'Chocolate Cake', ingredients: 'stuff',
               steps: 'more stuff ahahahhah')
@recipe2 = Recipe.create(recipe_name: 'Apple Pie', ingredients: "Apples\nCinnamon\nSugar",
               steps: "Make\nBake\nEat")

Schedule.create(event_type: 1, event_date: '20130413', recipe_id: @recipe1.id, user_account_id: @user2.id)