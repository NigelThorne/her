require "her/middleware/parse_json"
require "her/middleware/first_level_parse_json"
require "her/middleware/second_level_parse_json"
require "her/middleware/accept_json"
require "her/middleware/parse_xml"
require "her/middleware/first_level_parse_xml"
#require "her/middleware/second_level_parse_xml"
require "her/middleware/accept_xml"

module Her
  module Middleware
    DefaultParseJSON = FirstLevelParseJSON
    DefaultParseXML = FirstLevelParseXML
  end
end
