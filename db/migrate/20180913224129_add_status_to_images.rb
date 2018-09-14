class AddStatusToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :finished, :boolean
  end
end
