ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, 
  :fname, :mname, :lname


  index do
    selectable_column
    column :fname
    column :mname
    column :lname
    column :email
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

  filter :fname
  filter :mname
  filter :lname

  

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