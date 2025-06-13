class Friend < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 50 }

  validates :email, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: "must be a valid email address"
  }, allow_blank: true

  validate :phone_format_is_valid, if: -> { phone.present? }

  validates :twitter, format: {
    with: /\A@?[A-Za-z0-9_]{1,15}\z/,
    message: "must be a valid Twitter handle (1-15 characters, letters, numbers, underscores)"
  }, allow_blank: true

  # Clean up phone number before saving
  before_save :normalize_phone_number

  # Clean up Twitter handle before saving
  before_save :normalize_twitter_handle

  private

  def normalize_phone_number
    if phone.present?
      # Remove all non-digit characters except + at the beginning
      self.phone = phone.gsub(/[^\d+]/, "")
      # Ensure + is only at the beginning
      self.phone = phone.gsub(/(?<!^)\+/, "")
    end
  end

  def normalize_twitter_handle
    if twitter.present?
      # Remove @ if present and ensure it's clean
      self.twitter = twitter.gsub(/^@/, "")
    end
  end

  def phone_format_is_valid
    return unless phone.present?

    # International phone number validation based on GeeksforGeeks pattern
    # Allows: +country_code followed by 6-15 characters (digits, spaces, dashes, parentheses, dots)
    # Must start with + and end with a digit
    international_pattern = /\A\+[0-9\-\(\)\/\.\s]{6,15}[0-9]\z/

    # Also allow common US domestic formats without country code
    us_domestic_patterns = [
      /\A\d{10}\z/,                    # 5551234567
      /\A\d{3}-\d{3}-\d{4}\z/,        # 555-123-4567
      /\A\(\d{3}\) \d{3}-\d{4}\z/,    # (555) 123-4567
      /\A\d{3}\.\d{3}\.\d{4}\z/,      # 555.123.4567
      /\A\d{3} \d{3} \d{4}\z/         # 555 123 4567
    ]

    is_valid = international_pattern.match?(phone) ||
               us_domestic_patterns.any? { |pattern| phone.match?(pattern) }

    unless is_valid
      errors.add(:phone, "format is invalid. Use formats like: +1 555 123 4567, 555-123-4567, or (555) 123-4567")
    end
  end
end
