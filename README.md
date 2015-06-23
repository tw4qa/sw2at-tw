# sw2at-tw
## SWAT(Simple Way to Automate Tests) - Test World 
Gem for simplying initialization of complex data in your tests.

## How to install

Check this [example](https://github.com/tw4qa/swat-tw-example) or follow instructions below.

`gem install rails`

`rails new swat-tw-app`

`cd swat-tw-app`

`bundle install`

install RSpec
```ruby
group :development, :test do
  gem 'rspec-rails', '~> 3.0'
end
```
`bundle install`

Add RSpec files.

`rails generate rspec:install`

Create some database for your app.

`rake db:create`

Add a model

`rails g model User`

```ruby
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :email, :string
      t.column :full_name, :string
      
      t.timestamps null: false
    end
  end
end
```

`rake db:migrate`


Add TestWorld gem to your Gemfile

```ruby
gem 'sw2at-tw', '0.0.3'
```

`bundle install`

Create your own TestWorld class

`rails g swat:test_world:install AppTestWorld`

Edit your new class in [Rails.root]/lib/swat/AppTestWorld.rb
Add Methods:
```ruby
  def init_situation
    if @options[:john]
      User.create(email: 'john.smith@gmail.com', full_name: 'John Smith')
    end

    if @options[:josh]
      User.create(email: 'josh.doe@gmail.com', full_name: 'Josh Doe')
    end
  end
  
  def some_very_specific_logic
    puts 'Hello Test Word!'
  end
```

Configure RSpec, add lines tp [Rails.root]/spec/spec_helper.rb

```ruby
require 'sw2at-tw'
require_relative '../lib/swat/AppTestWorld'
Swat::TestWorld.setup(config, klass: AppTestWorld)
```

Use helpers in your test. [Rails.root]/spec/models/user_spec.rb

```ruby
require 'rails_helper'

RSpec.describe User, type: :model do

  context 'No Swat Options' do
    init_tw

    it 'should have Users' do
      expect(User.count).to eq(0)
    end

  end

  context 'John created' do
    init_tw( john: true )

    it 'should have Users' do

      expect(User.count).to eq(1)
      john = User.where(email: 'john.smith@gmail.com').take
      expect(john.full_name).to eq('John Smith')
    end

  end

  context 'John & Josh' do
    init_tw( john: true, josh: true )

    it 'should have Users' do
      expect(User.all.map(&:full_name)).to eq([ 'John Smith', 'Josh Doe' ])
    end
  end
  
  context 'Methods' do
    init_tw

    it 'should call Test World methods' do
      @tw.some_very_specific_logic
    end

  end
```

Run RSpec

`rspec`

## Contributing to sw2at-tw
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

# Copyright

Copyright (c) 2015 Vitaly Tarasenko. See LICENSE.txt for
further details.

