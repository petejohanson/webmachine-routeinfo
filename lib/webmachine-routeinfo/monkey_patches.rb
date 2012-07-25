
require 'webmachine'
require 'webmachine-routeinfo/routes_resource'

module Webmachine
  class Application
    def add_routes_resource
      routes do
        add ['_routes', '*'], Webmachine::RouteInfo::RoutesResource
      end

      orig_rc = dispatcher.resource_creator

      dispatcher.resource_creator = lambda { |route,req,resp|
	r = orig_rc.call(route, req, resp)
	r.routes = self.routes if r.kind_of?(Webmachine::RouteInfo::RoutesResource)

	r
      }
    end
  end
end
