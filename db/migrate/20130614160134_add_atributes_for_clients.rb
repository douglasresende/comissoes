class AddAtributesForClients < ActiveRecord::Migration
  def change
    add_column :clients, :cpf, :string
    add_column :clients, :address, :string
    add_column :clients, :neighborhood, :string
    add_column :clients, :city, :string
    add_column :clients, :stade, :string
    add_column :clients, :zip, :string
  end
  add_index :clients, :name, :uniqueness => true
end
