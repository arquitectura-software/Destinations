module Types
  class QueryType < Types::BaseObject
    field :get_destinations, [DestinationType], null: false

    def get_destinations
      Destination.all
    end
  end
end