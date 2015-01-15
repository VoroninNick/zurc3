unless RakeSettings.self_skip_initializers?
  if ActiveRecord::Base.connection.tables.include?(AdminUser.table_name)
    ActiveAdmin.register AdminUser do
      #menu label: proc { I18n.t('activerecord.models.admin_user.other') }
      #title proc { I18n.t('activerecord.models.admin_user.other') }
      #plural_resource_label label: proc { I18n.t('activerecord.models.admin_user.other') }
      permit_params :email, :password, :password_confirmation

      index do
        title proc { I18n.t('activerecord.models.admin_user.other') }

        selectable_column
        id_column
        column :email
        column :current_sign_in_at
        column :sign_in_count
        column :created_at
        actions
      end

      filter :email
      filter :current_sign_in_at
      filter :sign_in_count
      filter :created_at

      form do |f|
        title proc { I18n.t('activerecord.models.admin_user.other') }
        f.inputs "Admin Details" do
          f.input :email
          f.input :password
          f.input :password_confirmation
        end
        f.actions
      end

    end
  end
end