require "coffee-script"

module Rack
  module CoffeeFilter
    class Filter
      def initialize(app, wrap_js = false)
        @wrap_js = wrap_js
        @app = app
      end

      def filtered_response(env)
        status, headers, body = @app.call(env)

        if !(200..299).cover?(status)
          return @app.call(env)
        else
          parts = []
          body.each { |part| parts << part.to_s }

          javascript = [::CoffeeScript.compile(parts.join, { bare: !@wrap_js })]

          headers['Content-Length'] = javascript.length.to_s
          headers['Content-Type'] = 'application/javascript;charset=utf-8'
          headers['Cache-Control'] = 'private, max-age=0, no-cache'
          headers['Last-Modified'] = Time.now.to_s

          [200, headers, javascript]
        end
      end

      def call(env)
        env['PATH_INFO'].match(/\.coffee$/) ? filtered_response(env) : @app.call(env)
      end
    end
  end
end
