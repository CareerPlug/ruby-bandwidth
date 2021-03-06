module Bandwidth
  AVAILABLE_NUMBER_PATH = 'availableNumbers'

  # The Available Numbers resource lets you search for numbers that are available for use with your application.
  class AvailableNumber
    extend ClientWrapper

    # Search for available toll free numbers
    # @param client [Client] optional client instance to make requests
    # @param query [Hash} hash with parameters to search: quantity, pattern
    # @return [Array] search result
    # @example
    #   result = AvailableNumber.search_toll_free(client, :quantity=>20)
    def self.search_toll_free(client, query = nil)
      client.make_request(:get, "#{AVAILABLE_NUMBER_PATH}/tollFree", query)[0]
    end
    wrap_client_arg :search_toll_free

    # Search for available local numbers
    # @param client [Client] optional client instance to make requests
    # @param query [Hash] hash with parametes to search: city, state, zip, areaCode, localNumber, inLocalCallingArea, quantity, pattern
    # @return [Array] search result
    # @example
    #   result = AvailableNumber.search_local(client, {:state=>"state", :zip=>"zip", :area_code=>"code"})
    def self.search_local(client, query = nil)
      client.make_request(:get, "#{AVAILABLE_NUMBER_PATH}/local", query)[0]
    end
    wrap_client_arg :search_local
  end
end
