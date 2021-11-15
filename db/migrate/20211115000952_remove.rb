class Remove < ActiveRecord::Migration[5.2]
  def change
    remove_column :api_keys, :bearer_id
    remove_column :api_keys, :bearer_type
  end
end
