ActiveAdmin.register Project do

  form multipart: true do |f|
    f.inputs 'Project' do
      f.input :title
      # f.input :avatar, as: :file
      f.input :avatar, required: false
    end

    f.actions
  end
  permit_params :title, :avatar
  
end
