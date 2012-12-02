require "coffee-script"

module Rack
  module CoffeeFilter
    class Filter
      def initialize(app, wrap_js = false)
        @wrap_js = wrap_js
        @app = app
      end

      def filtered_response(env)
        status, headers, response = @app.call(env)

        return @app.call(env) if !(200..299).cover?(status)

        response_body = ''
        response.each { |part| response_body += part }

        js = ::CoffeeScript.compile(response_body, { bare: !@wrap_js })

        headers['Content-Length'] = js.length.to_s
        headers['Content-Type'] = 'application/javascript;charset=utf-8'
        headers['Cache-Control'] = 'private, max-age=0, must-revalidate'
        headers['Last-Modified'] = Time.now.to_s

        [200, headers, [js]]
      end

      def call(env)
        env['PATH_INFO'].match(/\.coffee$/) ? filtered_response(env) : @app.call(env)
      end
    end
  end
end
