class Message
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :phone, :email, :message_text

  def persisted?
    false
  end
end