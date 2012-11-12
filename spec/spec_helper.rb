require File.expand_path('../../lib/pivotal', __FILE__)

Bundler.require(:test)

Dir[File.expand_path('../{support,matchers}/*.rb', __FILE__)].each{|f| require(f)}

if ENV["MOCK_PIVOTAL"] == "true"
  Pivotal::Client.mock!
end

RSpec.configure do |config|
  config.before(:all) do
    Pivotal::Client.reset! if Pivotal::Client.mocking?
  end
end

