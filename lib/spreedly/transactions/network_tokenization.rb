module Spreedly
  class NetworkTokenization
    include Fields
    include ErrorsParser

    field :provisioned, type: :boolean
    field :token_status
    attr_reader :errors

    def initialize(xml_doc)
      initialize_fields(xml_doc)
      @errors = errors_from(xml_doc)
    end
  end
end
