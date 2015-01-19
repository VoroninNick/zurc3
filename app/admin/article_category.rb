unless RakeSettings.self_skip_initializers?
  ActiveAdmin.register ArticleCategory do


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

    sortable tree: true

    index :as => :sortable do
      label proc {|item| item.name } # item content
      actions
    end

    form do |f|
      f.inputs do
        f.translate_inputs do |t|
          t.input :name
        end

      end

      f.actions
    end

  end
end