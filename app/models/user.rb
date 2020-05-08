class User < ActiveRecord::Base
  has_many:todos
  def to_pleasant_string
    "#{id}. #{name} #{email} #{password}"
  end
end