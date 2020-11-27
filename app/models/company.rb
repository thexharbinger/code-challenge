class Company < ApplicationRecord
  has_rich_text :description

  validates :email,
        format: { with: /.+@getmainstreet\.com\z/,
                  message: "The email must be of domain getmainstreet.com" },
        if: -> { email_changed? && email? }

  before_save :update_city_state, if: :zip_code_changed?

  def city_state
    [city, state].compact.blank? ? 'City, State' : [city, state].join(',')
  end

  def update_city_state
    address = ZipCodes.identify(zip_code)
    unless address.nil?
      self.city = address[:city]
      self.state = address[:state_code]
    end
  end
end
