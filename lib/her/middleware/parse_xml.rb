module Her
  module Middleware
    class ParseXML < Faraday::Response::Middleware
      # @private
      def parse_xml(body = nil)
        body ||= ''
        message = "Response from the API must behave like a Hash or an Array (last XML response was #{body.inspect})"

        begin
          puts body
          xml = Nori.new(:convert_tags_to => lambda { |tag| tag.snakecase.gsub("@","").to_sym }).parse(body)
          # if(xml.keys.length==1 && xml.values[0].keys.length==1)
          #   xml = xml.values[0].values[0]
          # end
          puts xml.inspect
        rescue 
          raise Her::Errors::ParseError, message
        end

        raise Her::Errors::ParseError, message unless xml.is_a?(Hash) or xml.is_a?(Array)

        xml
      end
    end
  end
end
