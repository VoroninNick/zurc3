class Asset < ActiveRecord::Base
  attr_accessible :file
  belongs_to :assetable, polymorphic: true

  # simplify access to file's url and path
  delegate :url, :current_path, to: :file
end
