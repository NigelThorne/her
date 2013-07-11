module Her
  module Middleware
    # This middleware adds a "Accept: application/xml" HTTP header
    class AcceptXML < Faraday::Middleware
      # @private
      def add_header(headers)
        headers.merge! "Accept" => "application/xml"
      end

      # @private
      def call(env)
        add_header(env[:request_headers])
        @app.call(env)
      end
    end
  end
end
