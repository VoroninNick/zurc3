class CreateActiveAdminSettingsTables < ActiveRecord::Migration
  def up
    # ============================================
    # --------------------------------------------
    # CreateActiveadminSettingsPictures
    # --------------------------------------------
    # ============================================

    create_table :activeadmin_settings_pictures do |t|
      t.string :data
      t.string :data_file_size
      t.string :data_content_type
      t.integer :width
      t.integer :height

      t.timestamps
    end

    # ============================================
    # --------------------------------------------
    # CreateActiveadminSettingsSettings
    # --------------------------------------------
    # ============================================

    create_table :activeadmin_settings_settings do |t|
      t.string :name
      t.string :string
      t.string :file

      t.timestamps
    end

    # ============================================
    # --------------------------------------------
    # AddLocaleToActiveadminSettingsSettings
    # --------------------------------------------
    # ============================================

    add_column :activeadmin_settings_settings, :locale, :string

    ActiveadminSettings::Setting.update_all("locale = '#{ I18n.default_locale }'")

  end

  def down
    # ============================================
    # --------------------------------------------
    # CreateActiveadminSettingsPictures
    # --------------------------------------------
    # ============================================

    drop_table :activeadmin_settings_pictures

    # ============================================
    # --------------------------------------------
    # CreateActiveadminSettingsSettings
    # --------------------------------------------
    # ============================================

    drop_table :activeadmin_settings_settings

    # ============================================
    # --------------------------------------------
    # AddLocaleToActiveadminSettingsSettings
    # --------------------------------------------
    # ============================================
  end
end
