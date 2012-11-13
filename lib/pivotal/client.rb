require 'logger'

class Pivotal::Client < Cistern::Service

  model_path "pivotal/models"
  request_path "pivotal/requests"

  model :project
  collection :projects
  request :get_project
  request :get_projects

  model :iteration
  collection :iterations
  request :get_iteration
  request :get_iterations

  model :story

  recognizes :token, :url, :logger, :adapter, :connection_options

  class Real

    def initialize(options={})
      @token = options[:token] || File.read(File.expand_path("~/.pivotal"))
      @url   = options[:url]   || "https://www.pivotaltracker.com/services/v3/"

      raise "Missing token" unless @token

      @logger            = options[:logger] || Logger.new(nil)
      adapter            = options[:adapter] || Faraday.default_adapter
      connection_options = options[:connection_options] || {ssl: {verify: false}}

      @connection = Faraday.new({url: @url}.merge(connection_options)) do |builder|
        # response
        builder.use Faraday::Response::RaiseError
        builder.response :xml,  :content_type => /\bxml$/

        # request
        builder.request :multipart
        builder.request :xml

        builder.use Pivotal::Logger, @logger
        builder.adapter adapter
      end
    end

    def request(options={})
      method  = options[:method] || :get
      url     = File.join(@url, options[:path])
      params  = options[:params] || {}
      body    = options[:body]
      headers = {
        "X-TrackerToken" => @token,
      }.merge(options[:headers] || {})

      response = @connection.send(method) do |req|
        req.url(url)
        req.headers.merge!(headers)
        req.params.merge!(params)
        req.body = body
      end
    end
  end # Real

  class Mock
    def initialize(options={})
    end
  end # Mock
end # Pivotal::Client
