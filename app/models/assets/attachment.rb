class Assets::Attachment < Asset
  # You can process the uploaded images and create multiple versions
  mount_uploader :file, AttachmentUploader

  def icon_url
    extension = "#{self.file.file.extension.downcase}"
    ActionController::Base.helpers.asset_path("file_icons/#{extension}.png")
  end
end