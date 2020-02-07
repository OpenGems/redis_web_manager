# RedisWebManager

[![Gem Version](https://badge.fury.io/rb/redis_web_manager.svg)](https://badge.fury.io/rb/redis_web_manager)
[![Maintainability](https://api.codeclimate.com/v1/badges/55600fe789679fe62d8b/maintainability)](https://codeclimate.com/github/OpenGems/redis_web_manager/maintainability)
[![Build Status](https://travis-ci.org/OpenGems/redis_web_manager.svg?branch=master)](https://travis-ci.org/OpenGems/redis_web_manager)
[![security](https://hakiri.io/github/OpenGems/redis_web_manager/master.svg)](https://hakiri.io/github/OpenGems/redis_web_manager/master)
![Gem](https://img.shields.io/gem/dt/redis_web_manager)
[![Coverage Status](https://coveralls.io/repos/github/OpenGems/redis_web_manager/badge.svg?branch=master)](https://coveralls.io/github/OpenGems/redis_web_manager?branch=master)

Manage your Redis instance (See keys, memory used, connected client, configuration, information)

## Usage
How to use my plugin.

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
