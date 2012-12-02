# Rack::CoffeeFilter

Watches for .coffee requests and tries to compile down to javascript. It will only try to compile HTTP 2xx responses; everything else just gets passed along. It doesn't check to see if the file is actually coffeescript because it's not your mom. It doesn't do caching. Produces bare (unwrapped) javascript by default. Do `use Rack::CoffeeFilter::Filter, true` to wrap.

You might think you want to use this gem. You could be wrong.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-coffee_filter'

## Usage


In your config.ru

    use Rack::CoffeeFilter::Filter
    # if you want to wrap the output in a function
    # use Rack::CoffeeFilter::Filter, true
