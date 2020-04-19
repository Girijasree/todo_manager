require "active_record"

class Todo < ActiveRecord::Base
  def self.overdue
    where("due_date < ? and (not completed)", Date.today)
  end
  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end
  def self.completed
    where(completed: true)
  end

  def self.show_list
    puts "My Todo-list\n\n"

    puts "Overdue\n"
    puts overdue.to_displayable_list.join("\n")
    puts "\n\n"

    puts "Due Today\n"
    puts due_today.to_displayable_list.join("\n")
    puts "\n\n"

    puts "Due Later\n"
    puts due_later.to_displayable_list.join("\n")
    puts "\n\n"
  end
  def self.add_task(h)
    create!(todo_text: h[:todo_text], due_date: Date.today + h[:due_in_days], completed: false)
  end
  def self.mark_as_complete!(i)
    todo = find_by(id: i)
    todo.update(completed: true)
    return todo
  end
end