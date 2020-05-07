class Platform < ApplicationRecord
    has_and_belongs_to_many :games
    def self.search(query)
        where("name like ?", "%#{query}%")
    end

    @@platform_filter = []

    def self.platform_filter
        return @@platform_filter
    end

    def self.set_platform_filter(platform_filter)
        @@platform_filter = platform_filter
    end
end
