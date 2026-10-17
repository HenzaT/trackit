class SetDefaultStatusOnProjects < ActiveRecord::Migration[7.1]
  def change
    change_column_default :projects, :status, from: nil, to: 'open'
  end
end
