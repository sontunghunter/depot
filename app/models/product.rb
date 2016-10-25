class Product < ActiveRecord::Base
    has_many :line_items
    
    before_destroy :ensure_not_referenced_by_any_line_item
    
    
    / title, description, img_url not allow null / 
    validates :title , :description , :img_url , presence: true
    / price just allow number and greater 0.01 / 
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    / title is unique / 
    validates :title, uniqueness: true
    / img_url just allow type .gif, .png, .jpg /
    validates :img_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: "just allow type .gif, .png, .jpg"
    }
    def self.latest
        Product.order(:updated_at).last
    end
    
    private
        # ensure that there are no line items referencing this product
        def ensure_not_referenced_by_any_line_item
            if line_items.empty?
                return true
            else
                errors.add(:base, 'Line Items present')
                return false
        end
    end
end
