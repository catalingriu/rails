class Game < ApplicationRecord  
    has_many :loans, dependent: :destroy
    has_many :users, :through => :loans

    has_and_belongs_to_many :platforms
    
    has_rich_text :about
    validates :quantity, numericality: { greater_than: -1}
    has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/gta5.jpg"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    
    @@sort_order = ""
    def self.sort_order
        return @@sort_order
    end

    def self.search(query)
         where("name like ? OR about like ? OR year like ?", "%#{query}%", "%#{query}%", "%#{query}%")
    end

    def self.order_list(sort_order)
        if sort_order.blank?
           sort_order = @@sort_order
        end

        @@sort_order = sort_order
        if sort_order=="newest" || sort_order == ""
            order("created_at desc")
        elsif sort_order == "oldest"
           order("created_at asc")
        else
            left_joins(:loans).group("games.id").order("count(games.id) DESC")
        end
    end


end
