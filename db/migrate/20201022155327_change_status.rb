class ChangeStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :status, :string, default: 'ongoing'
  end
end
