ActiveAdmin.register Category do

  config.sort_order = 'created_at_desc'

  scope("Active") { |scope| scope.where(active: true) }
  scope("InActive") { |scope| scope.where(active: false) }

  filter :name
  filter :description
  filter :active
  filter :created_at
  filter :updated_at


  permit_params :name, :description

  index do
    column :name
    column :description
    column :active
    column :updated_at do |obj|
      obj.updated_at.strftime("%B %d, %Y %l:%M%p %z")
    end
    column :created_at do |obj|
      obj.created_at.strftime("%B %d, %Y %l:%M%p %z")
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :active
      row :updated_at do |obj|
        obj.updated_at.strftime("%B %d, %Y %l:%M%p %z")
      end
      row :created_at do |obj|
        obj.created_at.strftime("%B %d, %Y %l:%M%p %z")
      end
    end
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :description
      f.input :active
    end
    f.actions
  end
end


