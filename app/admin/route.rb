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

    form do |f|
      f.inputs do
        f.input :name
        f.input :route_name
        f.input :controller_action
        f.input :methods
      end

      f.translate_inputs do |t|
        t.input :route_string
        t.input :redirect_to_url
      end

      f.actions
    end


  end
end