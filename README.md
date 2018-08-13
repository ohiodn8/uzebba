# Uzebba
<strong>Ruby on Rails monitoring tool for monitoring system performance (cpu & memory usage)</strong>
<p><small>Not yet complete. . .</small></p>

## Installation
<strong>1. Add this line to your application's Gemfile:</strong>

```ruby
gem 'uzebba', :git => 'git://github.com/ohiodn8/uzebba.git'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install uzebba
```
<hr>
<strong>2. Run Generator</strong>
```bash
$ rails generate uzebba:install
```

<strong>Run Migration</strong>
```bash
$ rails db:migrate
```

## Usage
In routes.rb
```ruby
mount Uzebba::Engine => "/uzebba"
```

<strong>Visit: http://localhost:3000/uzebba</strong>

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
