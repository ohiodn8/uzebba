# Uzebba
<strong>Ruby on Rails monitoring tool for monitoring system performance (cpu & memory usage)</strong>
<img src="https://github.com/ohiodn8/image-repo/blob/master/uzebba_monitoring2.PNG" alt="docimer-screenshot"> 

## Installation
<strong>1. Add this line to your application's Gemfile:</strong>
```ruby
gem 'uzebba'
```

OR get it from git:


```ruby
gem 'uzebba', git: 'git://github.com/ohiodn8/uzebba.git'
```

And then execute:
```bash
$ bundle install
```
 
 
<hr>
<strong>2. Run Generator:</strong>
<pre><code>$ rails generate uzebba:install </code></pre>
 
<strong>Run Migration:</strong>
```bash
$ rails db:migrate
```

## Usage
In routes.rb
```ruby
mount Uzebba::Engine => "/uzebba"
```

<strong>Visit: http://localhost:3000/uzebba</strong>




## About the Gem 
<p>This gem is a monitoring tool that monitors cpu and memory usage. The gem is based off of a tutorial that I decided to package as a gem. The gem heavily depends on the <a href="https://github.com/plashchynski/crono">crono gem</a> to handle background process, and <a href="https://github.com/ankane/chartkick">chartkick gem</a> for the monitoring charts. You don't have to install chartkick or crono as the uzebba gem will handle the installation.</p>

<p><strong><u>For Windows</u>: </strong> when you start the rails server, the gem will open a new cmd minimized on the taskbar. When you stop the rails server the application will also close the minimized cmd. This is the gem's way of imitating a Linux background process to handle the crono process.</p>

<p><strong><u>For Linux</u>: </strong> when you start the rails server, the crono process will run in background; and when you stop the rails server, the crono process should stop. [<strike>To stop the process via the terminal, you have to do <code>ps aux | grep crono</code> to view the crono pid, and <code>kill -s sigterm [pid]</code> to terminate the process.</strike>]</p>

<p><strong>Do not use in production.</strong></p>



## Contributing
Contribution directions go here.


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
