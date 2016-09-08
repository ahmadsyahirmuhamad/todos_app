ActiveAdmin.register Todo do

  config.sort_order = 'created_at_desc'

  scope("Complete") { |scope| scope.where(status: true) }
  scope("InComplete") { |scope| scope.where(status: false) }


  filter :title
  filter :description
  filter :category_id
  filter :status
  filter :user_id
  filter :created_at
  filter :updated_at


  permit_params :title, :description, :category_id, :status, :user_id

  index do
    column :title
    column :description
    column :category do |todo|
      todo.category.name
    end
    column :status
    column :user do |todo|
      todo.user.first_name
    end
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
      row :title
      row :description
      row :category_id
      row :status
      row :user_id
      row :updated_at do |obj|
        obj.updated_at.strftime("%B %d, %Y %l:%M%p %z")
      end
      row :created_at do |obj|
        obj.created_at.strftime("%B %d, %Y %l:%M%p %z")
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :description
      f.input :status
      f.inputs 'Required Details' do
        f.input :user, label: 'User Name', :collection => User.order(:first_name)
        f.input :category, label: 'Category Name', :collection => Category.order(:name)
      end
    end
    f.actions
  end
end
