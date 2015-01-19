unless RakeSettings.self_skip_initializers?
  ActiveAdmin.register GalleryAlbum do
    menu false

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

    permit_params :name, :locale, image_ids: [], gallery_image_ids: []

    association_actions

    form do |f|
      f.inputs "Album Details" do
        f.translate_inputs do |t|
          t.input :name
        end
      end

      f.inputs do
        render "active_admin_multi_upload/upload_form", resource: f.object, association: "images", attribute: "file" , options: {  }
      end

      f.inputs do
        render "active_admin_multi_upload/upload_form", resource: f.object, association: "gallery_images", attribute: "file" , options: {  }
      end

      f.actions
    end


  end
end