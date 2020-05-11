class DropTodos < ActiveRecord::Migration[6.0]
  def change
    drop_table :todos
  end
end
