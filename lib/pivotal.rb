require "pivotal/version"

require 'cistern'
require 'xmlsimple'
require 'faraday'
require 'faraday_middleware'

module Pivotal
  require 'pivotal/encode_xml'

  autoload :Client, 'pivotal/client'
  autoload :Logger, 'pivotal/logger'
end
