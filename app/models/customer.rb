class Customer < ApplicationRecord
    has_one_attached :image

   def self.ransackable_attributes(auth_object = nil)
    ["created_at", "emailaddress", "fullname", "id", "notes", "phoneno", "updated_at"]
  end
    def self.ransackable_associations(auth_object = nil)
    []
  end

  validates :fullname, presence: true
end
