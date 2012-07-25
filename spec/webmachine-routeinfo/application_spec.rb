
require 'webmachine-routeinfo/monkey_patches'
require 'webmachine-routeinfo/routes_resource'

describe Webmachine::Application do
  describe 'Application#add_routes_resource' do
    before do
      subject.add_routes_resource
    end

    it 'should have the resource in the routes' do
      subject.routes.first.resource.should eq Webmachine::RouteInfo::RoutesResource
    end

    it 'should create a resource with the routes populated' do
      resource = subject.dispatcher.resource_creator.call(subject.routes.first, nil, nil)
      
      resource.routes.should eq subject.routes
    end
  end
end
