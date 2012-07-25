
require 'webmachine'

module Webmachine
  module RouteInfo
    class RoutesResource < Webmachine::Resource
      attr_accessor :routes

      def content_types_provided
        [["text/html", :produce_list]]
      end

      def produce_list
        '<html><body>ROUTES!</body></html>'
        # TODO: mustache/erb template processing for routes
      end
    end
  end
end
