module Spreedly
  class NetworkTokenization
    include Fields
    include ErrorsParser

    field :provisioned, type: :boolean
    field :token_status
    attr_reader :errors

    def initialize(xml_doc)
      # initialize_fields(xml_doc)
      # Override because initialize_fields ignores network_tokenization fields
      self.class.fields.each do |field|
        node = xml_doc.at_xpath(".//#{field}")
        if node
          value = node.inner_html.strip
          instance_variable_set("@#{field}", value)
        end
      end

      @errors = errors_from(xml_doc)
    end
  end
end
