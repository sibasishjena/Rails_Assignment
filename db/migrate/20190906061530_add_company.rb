class AddCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :company, :string
    Employee.update_all(company: "Cybrilla")
  end
end
