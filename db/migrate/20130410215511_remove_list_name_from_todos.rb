class RemoveListNameFromTodos < ActiveRecord::Migration
  def change
    remove_column :todos, :list_name
  end
end
