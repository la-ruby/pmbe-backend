class RemoveOneCOl < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :display_name
  end
end
