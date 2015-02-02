# unless RakeSettings.self_skip_initializers?
#   if begin ActiveRecord::Base.connection.tables.include?(ArticleAd.table_name) rescue false end
#     ActiveAdmin.register ArticleAd do
#       #menu false
#
#       # See permitted parameters documentation:
#       # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#       #
#       # permit_params :list, :of, :attributes, :on, :model
#       #
#       # or
#       #
#       # permit_params do
#       #   permitted = [:permitted, :attributes]
#       #   permitted << :other if resource.something?
#       #   permitted
#       # end
#
#       permit_params :name, :short_description, :locale, :image_or_association, article_id: []
#
#
#
#       form do |f|
#         # f.inputs do
#         #   f.input :image_or_association, as: :radio, collection: ["yes", "no"]
#         #   #f.input :image_or_association, as: :radio
#         #   f.input :ad_image, as: :radio
#         # end
#
#         f.inputs do
#           f.input :article
#           f.input :ad_image, as: :file
#         end
#
#
#         # tr do |t|
#         #   t.input 'image_or_association'
#         # end
#
#         f.actions
#       end
#
#     end
#   end
# end