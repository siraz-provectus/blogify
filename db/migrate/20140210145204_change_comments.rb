class ChangeComments < ActiveRecord::Migration
  def change
    change_column :comments, :status, :string, default: :pending
  end
end