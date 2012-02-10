require 'faraday_middleware'

FaradayMiddleware::ParseJson.define_parser do |body|
  JSON.parse(body, :symbolize_names => true)
end
