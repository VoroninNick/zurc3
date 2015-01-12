ActiveAdmin.register Publication do


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

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs do
      f.input :release_date
    end
    f.translate_inputs do |t|
      raw [
              t.input(:locale, as: :hidden),
              t.input(:name),
              t.input(:author),
              t.input(:short_description),
              t.input(:intro),
              t.input(:avatar, as: :file),
              t.input(:full_description, as: :ckeditor,  class: "locale"  )].join
    end

    f.actions
  end


end
