require 'rubygems'
require 'bundler/setup'

require 'faraday'
require 'faraday_stack'

require File.expand_path('../harvester/time_entry', __FILE__)

module Harvester
  module Connection
    # TODO make it more generic
    def connection(authorization)
      Faraday.new(:url => 'https://kuahyeow.harvestapp.com', :headers => {:accept => 'application/json', :authorization => authorization}) do |builder|
        builder.use FaradayStack::ResponseJSON,   :content_type => 'application/json'
        builder.use Faraday::Request::JSON        # encode request params as json
        builder.use Faraday::Response::Logger     # log the request to STDOUT
        builder.use Faraday::Response::RaiseError   # raise exceptions on 40x, 50x responses
        builder.use Faraday::Adapter::NetHttp     # make http requests with Net::HTTP
      end
    end
  end


  class API
    include Connection

    def initialize(options = {})
      @authorization = options[:authorization]
    end

    def project_time(project_id, from_date, to_date)
      response = get "/projects/#{project_id}/entries?from=#{from_date}&to=#{to_date}"
      response.body
    end

    protected
    def get(url)
      connection(@authorization).get url
    rescue Faraday::Error
      raise
    end
  end
end

