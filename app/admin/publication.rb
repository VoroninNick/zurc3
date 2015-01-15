unless RakeSettings.self_skip_initializers?
  if ActiveRecord::Base.connection.tables.include?(Publication.table_name)
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

      index do
        column :release_date
        column :name
        column :author
        column :avatar do |item|
          image_tag(item.avatar.url(:thumb))
        end

      end

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
                  f.inputs(:avatar_field){
                    t.input :avatar, :as => :file, :hint => (t.object.avatar.present? ? t.template.image_tag(t.object.avatar.url(:thumb))
                                                              : t.template.content_tag(:span, "no cover page yet"))
                  t.input :avatar_cache, :as => :hidden if t.object.respond_to?(:avatar_cache)  },
                  #t.input(:avatar, as: :file),
                  t.input(:full_description, as: :ckeditor,  class: "locale"  )].join
        end

        f.actions
      end


    end
  end
end