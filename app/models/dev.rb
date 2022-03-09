class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def recevied_one?(item_name)
        self.freebies.pluck(:item_name).include? item_name
    end

    def give_away(dev, freebie)
        if freebie.dev == self
            freebie.dev = dev
        end
    end
end
