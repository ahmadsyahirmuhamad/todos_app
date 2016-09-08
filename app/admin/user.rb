ActiveAdmin.register User do

  config.sort_order = 'created_at_desc'

  scope("Active") { |scope| scope.where(active: true) }
  scope("InActive") { |scope| scope.where(active: false) }


  filter :first_name
  filter :last_name
  filter :email
  filter :active
  filter :updated_at
  filter :created_at


  permit_params :first_name, :last_name, :email, :active, :password, :password_confirmation
   # track_users_attributes: [:id, :user_id, :track_id, :selected, :_destroy]

  index do
    column :first_name
    column :last_name
    column :email
    column :active
    column :todos do |user|
      user.todos.count
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
      row :first_name
      row :last_name
      row :email
      row :active
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
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :active
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
