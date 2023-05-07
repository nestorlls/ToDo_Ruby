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

def list_todos(todos)
  todos.each do |todo|
    puts "#{todo[:id]}. #{todo[:content]}"
  end
end

def print_menu
  array_menu = %w[add list completed toggle delete exit]
  puts '-' * 64
  puts array_menu.join(' | ')
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
  when 'add' then 'Action add'
  when 'list' then 'show list'
  when 'completed' then 'show todos completed'
  when 'toggle' then 'Action toggle'
  when 'delete' then 'Action delete'
  end
end

puts 'Thanks for using toDOS!'