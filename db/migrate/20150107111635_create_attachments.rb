class CreateAttachments < ActiveRecord::Migration
  def up
    attachments_table_name = :attachments
    create_table attachments_table_name do |t|
      t.string :file
      t.string :attachable_type
      t.string :attachable_id
    end

    attachment_model = Attachment

    attachment_model.create_translation_table!(file: :string)
  end

  def down
    attachment_model = Attachment

    drop_table attachment_model.table_name

    attachment_model.drop_translation_table!
  end
end
