module Types
    class DestinationType < BaseObject
      field :id, Integer, null: false
      field :name, String, null: false
      field :weather, String, null: false
      field :description, String, null: false
      field :timezone, String, null: false
      field :cityimage, String, null: false
      field :landingtime, String, null: false
      field :boardingtime, String, null: false
    end
end
  
