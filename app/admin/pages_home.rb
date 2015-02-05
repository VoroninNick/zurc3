ActiveAdmin.register Pages::Home do
  menu label: "Головна", parent: "Сторінки"

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

  permit_params  first_about_attributes: [:id, translations_attributes: [:title, :description, :locale, :id, :partials_home_first_about_id]  ],
                second_about_attributes: [:id, translations_attributes: [:title, :description, :locale, :id, :partials_home_second_about_id]  ]


  form do |f|


    f.inputs do
      #f.inputs "Про нас 1", for: [:first_about]

      f.has_many :first_about do |about|
        if about.object.new_record? || about.object.translations.count == 0
            I18n.available_locales.each do |locale|
              about.object.translations.build(locale: locale)
            end
        end

        about.has_many :translations, new_record: false, allow_destroy: false, collection: Pages do |t|
          t.input :locale, as: :string, input_html: { readonly: true }
          t.input :title
          t.input :description
        end
      end

      f.has_many :second_about do |about|
        if about.object.new_record? || about.object.translations.count == 0
          I18n.available_locales.each do |locale|
            about.object.translations.build(locale: locale)
          end
        end

        about.has_many :translations, new_record: false, allow_destroy: false, collection: Pages do |t|
          t.input :locale, as: :string, input_html: { readonly: true }
          t.input :title
          t.input :description
        end
      end


      # f.has_many :second_about do |about|
      #   about.translate_inputs do |t|
      #     t.input :title
      #     t.input :description
      #   end
      # end

    end

    f.actions
  end

end
