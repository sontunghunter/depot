class Product < ActiveRecord::Base
    / title, description, img_url not allow null / 
    validates :title , :description , :img_url , presence: true
    / price just allow number and greater 0.01 / 
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    / title is unique / 
    validates :title, uniqueness: true
    / img_url just allow type .gif, .png, .jpg /
    validates :img_url, allow_blank: true, format: {
        with: %r{\.(png|gif|jpg)\Z}i,
        message: "just allow type .gif, .png, .jpg"
    }
end
