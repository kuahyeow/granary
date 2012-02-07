require 'faraday_stack'

FaradayStack::ResponseJSON.define_parser do |body|
  Yajl::Parser.parse(body, :symbolize_keys => true)
end
