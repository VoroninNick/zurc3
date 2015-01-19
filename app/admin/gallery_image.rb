unless RakeSettings.self_skip_initializers?
  ActiveAdmin.register GalleryImage do
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

    allows_multi_upload mounted_uploader: :file, delete_url_method_name: "destroy_upload_admin_gallery_image_url"

    # form do |f|
    #   f.inputs do
    #     f.input :file
    #   end
    #
    #   f.actions
    # end


  end
end