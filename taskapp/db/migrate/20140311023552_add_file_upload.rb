class AddFileUpload < ActiveRecord::Migration
  def up
    add_attachment :projects, :avatar
  end

  def down
    add_attachment :projects, :avatar
  end
end
