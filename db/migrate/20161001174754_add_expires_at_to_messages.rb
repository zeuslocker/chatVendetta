class AddExpiresAtToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :expires_at, :datetime
  end
end
