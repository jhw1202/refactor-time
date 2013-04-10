class RemoveTodoCountFromTodos < ActiveRecord::Migration
  def change
    remove_column :todos, :todo_count
  end
end
