require 'faraday'

module Pivotal
  # Request middleware that encodes the body as xml.
  #
  # Processes only requests with matching Content-type or those without a type.
  # If a request doesn't have a type but has a body, it sets the Content-type
  # to xml MIME-type.
  #
  # Doesn't try to encode bodies that already are in string form.
  class EncodeXml < Faraday::Middleware
    CONTENT_TYPE = 'Content-Type'.freeze
    MIME_TYPE    = 'application/xml'.freeze

    dependency do
      require 'xmlsimple' unless defined?(XmlSimple)
    end

    def call(env)
      match_content_type(env) do |data|
        env[:body] = encode data
      end
      @app.call env
    end

    def encode(data)
      XmlSimple.xml_out(data)
    end

    def match_content_type(env)
      if process_request?(env)
        env[:request_headers][CONTENT_TYPE] ||= MIME_TYPE
        yield env[:body] unless env[:body].respond_to?(:to_str)
      end
    end

    def process_request?(env)
      type = request_type(env)
      has_body?(env) and (type.empty? or type == MIME_TYPE)
    end

    def has_body?(env)
      body = env[:body] and !(body.respond_to?(:to_str) and body.empty?)
    end

    def request_type(env)
      type = env[:request_headers][CONTENT_TYPE].to_s
      type = type.split(';', 2).first if type.index(';')
      type
    end
  end
end

if Faraday.respond_to? :register_middleware
  Faraday.register_middleware(:request, {:xml => lambda { Pivotal::EncodeXml }})
end
