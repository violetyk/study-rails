class AddImagePath < ActiveRecord::Migration
  def change
    add_column :projects, :image_path, :string
    add_column :projects, :image_url, :string
  end
end
