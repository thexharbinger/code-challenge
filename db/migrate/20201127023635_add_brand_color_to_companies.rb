class AddBrandColorToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :brand_color, :string, :null => false, :default => "#008b56"
  end
end
