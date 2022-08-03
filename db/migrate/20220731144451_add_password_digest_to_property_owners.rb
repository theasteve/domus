class AddPasswordDigestToPropertyOwners < ActiveRecord::Migration[7.0]
  def change
    add_column :property_owners, :password_digest, :string
  end
end
