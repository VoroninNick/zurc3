class Attachment < ActiveRecord::Base
  attr_accessible :attachable_id, :attachable_type, :file

  #mount_uploader :file, AttachmentUploader

  belongs_to :attachable, polymorphic: true

  translates :file, versioning: :paper_trail

  class Translation
    attr_accessible :file, :locale

    mount_uploader :file, AttachmentUploader
  end
end