swanager-api
==========


This gem provides an interface to the [Swanager Remote API](http://swanager.com/).

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'swanager-api'
```

And then run:

```shell
$ bundle install
```

Alternatively, if you wish to just use the gem in a script, you can run:

```shell
$ gem install swanager-api
```

Finally, just add `require 'swanager'` to the top of the file using this gem.

Using
------------

**Sign Up**
```ruby
client = Swanager::Client.new
client.signup('example@example.com', 'password')
```

**Sign In**
```ruby
client.signin('example@example.com', 'password')
```
or
```ruby
client = Swanager::Client.new('token')
```
**Applications**

Get applications:
```ruby
client.applications
```
Create application:
```ruby
client.applications.create({ name: 'app_name' })
```
Update application:
```ruby
app = client.applications.first
app.update({ name: 'name_upd' })
```
Start/stop application:
```ruby
app.start
app.stop
```
Get services for application:
```ruby
app.services
```

**Services**

Get services:
```ruby
client.services
```
or
```ruby
client.services(app.id)
```
Create service:
```ruby
client.services.create({ app_id: 'id', name: 'app_name' })
```
Update service:
```ruby
service = client.services.first
service.update({ name: 'name_upd' })
```
Start/stop service:
```ruby
service.start
service.stop
```
Delete service:
```ruby
client.services.delete(service.id)
```


Build
------------


```bash
gem build swanager-api.gemspec
```

License
-----

This program is licensed under the MIT license. See LICENSE for details.
