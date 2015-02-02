class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :phone, :email, :message_text

  def initialize message = nil
    if message && message.is_a?(Hash)
      message.each_pair do |key, value|
        send("#{key}=", value)
      end
    end

  end

  validates_presence_of :name, :phone, :email, :message_text
  validates_length_of :name, minimum: 2
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :phone, format: { with: /\A\+380\w\(\d\d\)\d\d\d\-\d\d\-\d\d\Z/ }


  def persisted?
    false
  end
end