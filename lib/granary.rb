require 'granary/version'

require 'faraday'
require 'faraday_middleware'

Dir[File.expand_path('../faraday/*.rb', __FILE__)].each{|f| require f}
require 'granary/time_entry'

module Granary
  module Connection
    def connection(root, authorization)
      Faraday.new(:url => root, :headers => {:accept => 'application/json', :authorization => authorization}) do |conn|
        conn.request :json

        conn.response :logger                                   # log the request to STDOUT
        conn.response :raise_error                              # raise exceptions on 40x, 50x responses
        conn.response :json,   :content_type => /\bjson$/       # requires json gem install in 1.8.7

        conn.adapter :net_http                                  # make http requests with Net::HTTP
      end
    end
  end


  class API
    include Connection

    attr_accessor :subdomain

    def initialize(options = {})
      @authorization = options[:authorization]
      @subdomain = options[:subdomain]
    end

    def project_time(project_id, from_date, to_date)
      response = get "/projects/#{project_id}/entries?from=#{from_date}&to=#{to_date}"
      response.body
    end

    protected
    def get(url)
      root = "https://#{subdomain}.harvestapp.com"
      connection(root, @authorization).get url
    rescue Faraday::Error
      raise
    end
  end
end

