## Dribble Clone (Rails v4 and bootstrap3)

Original example (Rails v5 and Bulma) by Andy Leverenz
https://github.com/justalever/dribbble_clone

Steps:
- Add ruby gems (checkout `Gemfile`)
- Configure bootstrap:
```
generate bootstrap:install static
```
- Generate bootstrap layout template
```
rails g bootstrap:layout application
```
- Configure simple_form:
```
rails generate simple_form:install
# or with bootstrap
rails generate simple_form:install --bootstrap
```
- Configure devise
```
rails generate devise:install
```
then add `config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }`
to `config/environments/development.rb` file.
- Customize Login/Logout pages:
```
rails generate devise:views
```

- Generate User Model:
```
rails generate devise User
rake db:migrate
```

- Add name field to user table:
```
rails g migration AddFieldsToUsers name:string
rake db:migrate
```

Create Shot model:
```
rails g scaffold Shot title:string description:text user_id:integer
```

Add has_many to User:
```
  has_many :shots, dependent: :destroy # delete shots if the user gets deleted
```

Add belongs_to to Shot:
```
  belongs_to :user
```

- Update migration:
```
rake db:migrate
```

- Generate file uploader (using CarrierWave gem)
```
rails generate uploader user_shot
```

- Create comments controller
```
rails g controller comments create destroy
rails g model Comment name:string response:text
rails g migration AddShotIdToComments
rails g migration AddUserIdToComments
rake db:migrate
```

- Generate impression table (for likes)
```
rails g impressionist
rake db:migrate
```

- Generate votes table
```
rails generate acts_as_votable:migration
rake db:migrate
```

Known issues:
- impressionist raises an [exception](https://github.com/charlotte-ruby/impressionist/issues/103) on show shot page.

Tested with:
* Ruby v2.3.7 & Rails v4.1.16
* Database: SQLite3.
