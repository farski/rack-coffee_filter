# Rack::CoffeeFilter

Watches for .coffee requests and tries to compile down to javascript. It will only try to compile HTTP 2xx responses; everything else just gets passed along. It doesn't check to see if the file is actually coffeescript because it's not your mom. It doesn't do caching. Produces bare (unwrapped) javascript by default. Do `use Rack::CoffeeFilter::Filter, true` to wrap.

You might think you want to use this gem. You could be wrong. It probably only makes sense for very small projects or in development. 

#### Caveat

Some rack servers (like Pow) serve files in /public statically. In those cases this gem won't do anything.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-coffee_filter'

## Usage


In your config.ru

    use Rack::CoffeeFilter::Filter
    # if you want to wrap the output in a function
    # use Rack::CoffeeFilter::Filter, true
