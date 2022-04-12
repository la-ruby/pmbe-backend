class CreateProductsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :display_name

      t.timestamps
    end
  end
end
