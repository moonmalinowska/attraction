ActiveAdmin.register Attraction do


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

  permit_params :name, :description, :address, :opening_hour, :duration, :reservation,
                :more_info, :picture, :url, :category_id, :region_id, :variety_id,
                :latitude, :longitude, :tag_list


  index do
    column :name
    column :description
    column :address
    column :opening_hour
    column :duration
    column :reservation
    column :more_info
    actions
  end

end

