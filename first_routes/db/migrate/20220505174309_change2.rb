class Change2 < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :likeable_id, :integer
    add_column :likes, :likeable_type, :string

    add_index :likes, [:likeable_id, :likeable_type]
  end
end
