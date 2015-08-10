ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, :first_name, 
  :last_name, :address1, :address2, :address3,
  :city, :state, :zip, :country, :phone, :status


  index do
    selectable_column
    column :fname, :label => "First Name"
    column :mname, :label => "Maiden Name"
    column :lname, :label => "Last Name"
    column :email
    column :created_at do |resource|
      resource.created_at.strftime("%B %d, %Y")
    end
    actions
  end

  show do
    attributes_table do
      row :email
      row :fname
      row :mname
      row :lname
      
      
    end
    
  end

  filter :fname, :label => "First Name"
  filter :mname, :label => "Maiden Name"
  filter :lname, :label => "Last Name"

  

  form do |f|
    f.inputs "User Details" do
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      else
        f.input :password
      end
      f.input :fname, :label => "First Name"
      f.input :mname, :label => "Maiden Name"
      f.input :lname, :label => "Last Name"
      
    end
    f.actions
  end
end