# data
id = 0
todos = [
  { id: (id = id.next), content: 'Fill the weekly feedback', completed: false },
  { id: (id = id.next), content: 'Complete Ruby Basics 1', completed: false },
  { id: (id = id.next), content: 'Complete Ruby Basics 2', completed: false },
  { id: (id = id.next), content: 'Complete Ruby Methods', completed: false },
  { id: (id = id.next), content: 'Do meditation', completed: false }
]

# methods
def welcome
  puts "#{'-' * 24} Welcome to ToDos #{'-' * 24} \n\n"
end

def list_todos(todos, completed = false)
  todos.each do |todo|
    puts "#{todo[:id]}. #{todo[:content]}" if todo[:completed] == completed
  end
end

def print_menu
  array_menu = %w[add list completed toggle delete exit]
  puts '-' * 64
  puts array_menu.join(' | ')
end

def add_todo(new_content, id, todos)
  new_todo = { id: id, content: new_content, completed: false }
  todos << new_todo
end

def toggle_todo(ids, todos)
  ids.each do |id|
    todo_found = todos.find { |todo| todo[:id] == id }
    todo_found[:completed] = !todo_found[:completed] if todo_found
  end
end

def delete_todo(id, todos)
  todos.delete_if { |todo| todo[:id] == id }
end

# main
welcome()
list_todos(todos)
print_menu()

action = nil
while action != 'exit'
  puts "\n"
  print 'action: '
  action = gets.chomp.strip

  case action
  when 'add'
    print 'content: '
    new_content = gets.chomp.strip
    id =id.next
    add_todo(new_content, id, todos)
    print_menu

  when 'list'
    puts "\n"
    list_todos(todos)
    print_menu
  when 'completed'
    puts "\n"
    list_todos(todos, completed = true)
    print_menu

  when 'toggle'
    print 'todo ID(s): '
    ids = gets.chomp.split(',').map{ |id| id.to_i}
    toggle_todo(ids, todos)
  when 'delete'
    print 'todo ID: '
    id = gets.chomp.to_i
    delete_todo(id, todos)
    print_menu
  end
end

puts 'Thanks for using toDOS!'