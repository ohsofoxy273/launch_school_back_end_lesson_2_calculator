# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo_item)
    todos << todo_item
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def item_at(index)
    raise IndexError if todos[index] == nil
    todos[index]
  end

  def mark_done_at(index)
    raise IndexError if todos[index] == nil
    todos[index].done!
  end

  def mark_undone_at(index)
    raise IndexError if todos[index] == nil
    todos[index].undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    raise IndexError if todos[index] == nil
    todos.delete_at(index)
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def <<(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo

    todos << todo
  end
  alias_method :add, :<<

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    @todos
  end

  def select
    list= TodoList.new(self.title)
    each do |todo|
      list.add(todo) if yield(todo)
    end
    list
  end

  def find_by_title(string)
    each do |todo|
      return todo if string == todo.title
    end
    .first
    nil
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(item_title)
    each do |todo|
      todo.done! if todo.title == item_title
    end
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def done!
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end
end

