class SetDefaultStatusOnTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_default :tasks, :status, from: nil, to: 'open'
  end
end
