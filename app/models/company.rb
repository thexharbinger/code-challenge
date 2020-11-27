class Company < ApplicationRecord
  has_rich_text :description

  validates :email,
        format: { with: /.+@getmainstreet\.com\z/,
                  message: "The email must be of domain getmainstreet.com" },
        if: -> { email_changed? && email? }
end
