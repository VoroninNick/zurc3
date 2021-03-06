unless RakeSettings.self_skip_initializers?
  ActiveAdmin.register Vs::Route do
    menu parent: proc { I18n.t("menu.labels.seo") }

    sortable

    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # permit_params :list, :of, :attributes, :on, :model
    #
    # or
    #
    # permit_params do
    #   permitted = [:permitted, :attributes]
    #   permitted << :other if resource.something?
    #   permitted
    # end

    index :as => :sortable do
      label :route_name

      actions
    end


  end
end