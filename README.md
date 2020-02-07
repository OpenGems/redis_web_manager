# RedisWebManager

[![Gem Version](https://badge.fury.io/rb/redis_web_manager.svg)](https://badge.fury.io/rb/redis_web_manager)
[![Maintainability](https://api.codeclimate.com/v1/badges/55600fe789679fe62d8b/maintainability)](https://codeclimate.com/github/OpenGems/redis_web_manager/maintainability)
[![Build Status](https://travis-ci.org/OpenGems/redis_web_manager.svg?branch=master)](https://travis-ci.org/OpenGems/redis_web_manager)
[![security](https://hakiri.io/github/OpenGems/redis_web_manager/master.svg)](https://hakiri.io/github/OpenGems/redis_web_manager/master)
![Gem](https://img.shields.io/gem/dt/redis_web_manager)
[![Coverage Status](https://coveralls.io/repos/github/OpenGems/redis_web_manager/badge.svg?branch=master)](https://coveralls.io/github/OpenGems/redis_web_manager?branch=master)

Web interface that allows you to manage easily your Redis instance (see keys, memory used, connected client, etc...). 

### Check your stats 
The Dashboard allows you tu check the Memory usage, CPU and Redis clients.

![alt text](./images/images_dashboard.png)

### Manage your redis keys
You can easily edit and delete any keys stored in your redis database.

![alt text](./images/images_keys.png)

### Keep an eye on your redis clients
Check how many clients are connected and their infos.

![alt text](./images/images_clients.png)

## Usage

1. Install the gem
 
2. Launch your rails server

3. in your `routes.rb` add : `mount RedisWebManager::Engine => '/redis_web_manager'`
 
3. Go to `/redis_web_manager` to access to the dashboard

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'redis_web_manager'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install redis_web_manager
```

<<<<<<< HEAD
## TODO
* [ ] Add filters to redis keys (filter by type, by expiration date...)
* [ ] Add graph for most used commands
* [ ] Manage multiple redis instances
* [ ] Real time chart update
* [ ] Alert system (ex: triggered when memory is peaking)
* [ ] Command line interface to manage your redis database
* [ ] Logs interface

## Configuration

You can configure RedisWebManager: 

```ruby
# initializers/redis_web_manager.rb

RedisWebManager.configure do |config|
  config.redis = Redis.new(db: 1) # Default Redis.new
  config.lifespan = 2.days # Default 15.days
  config.authenticate = 1 # Default nil
end
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/OpenGems/redis_web_manager. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
