class Asset < ActiveRecord::Base
  attr_accessible :file
  belongs_to :assetable, polymorphic: true

  attr_accessible :assetable, :assetable_id, :assetable_type

  # simplify access to file's url and path
  delegate :url, :current_path, to: :file

  attr_accessible :priority
end
