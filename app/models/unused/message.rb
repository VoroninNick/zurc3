class Message < PageBlock
  #include ActiveModel::Validations
  #include ActiveModel::Conversion
  #extend ActiveModel::Naming

  attr_accessor :name, :email, :content

  #Page.all

  validates_presence_of :name
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\Z/i
  validates_length_of :content, :maximum => 500
  validates

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end

