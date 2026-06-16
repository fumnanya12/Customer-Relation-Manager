ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :fullname, :phoneno, :emailaddress, :notes, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:fullname, :phoneno, :emailaddress, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
    filter :fullname
  filter :emailaddress
  filter :phoneno
  filter :created_at
  form do |f|
      f.inputs "Customer Details" do
        f.input :fullname
        f.input :emailaddress
        f.input :phoneno
        f.input :notes
        f.input :image, as: :file
      end

      f.actions
    end

    show do
      attributes_table do
        row :fullname
        row :emailaddress
        row :phoneno
        row :notes

        row :image do |customer|
          if customer.image.attached?
            image_tag url_for(customer.image), width: 200
          else
            "No image uploaded"
          end
        end
      end
    end

    index do
      selectable_column
      id_column
      column :fullname
      column :emailaddress
      column :phoneno
      column :notes

      column :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image), width: 80
        else
          "No image"
        end
      end

      actions
    end
end
