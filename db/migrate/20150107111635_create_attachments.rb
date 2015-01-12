class CreateAttachments < ActiveRecord::Migration
  def up
    attachment_model = Attachment
    create_table attachment_model.table_name do |t|
      t.string :file
      t.string :attachable_type
      t.string :attachable_id
    end

    attachment_model.create_translation_table!(file: :string)
  end

  def down
    attachment_model = Attachment

    drop_table attachment_model.table_name

    attachment_model.drop_translation_table!
  end
end
