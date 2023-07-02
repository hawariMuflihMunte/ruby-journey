class TodoApp
  def initialize
    @todos = []
  end

  def run
    loop do
      display_menu
      choice = gets.chomp.to_i
      case choice
      when 1
        add_todo
      when 2
        mark_as_done
      when 3
        list_todos
      when 4
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  def display_menu
    puts "\n===== Todo App ====="
    puts "1. Add a Todo"
    puts "2. Mark a Todo as Done"
    puts "3. List Todos"
    puts "4. Exit"
    print "Enter your choice: "
  end

  def add_todo
    print "Enter the desciption of the Todo: "
    description = gets.chomp

    @todos << { description: description, done: false }
    puts "Todo added successfully!"
  end

  def mark_as_done
    list_todos
    print "Enter the index of the Todo to mark as done: "
    index = gets.chomp.to_i
    if index >= 1 && index <= @todos.length
      @todos[index - 1][:done] = true
      puts "Todo marked as done!"
    else
      puts "Invalid index. Please try again."
    end
  end

  def list_todos
    puts "\n===== Todo List ====="
    @todos.each_with_index do |todo, index|
      status = todo[:done] ? "[X]" : "[]"
      puts "#{index + 1}. #{status} #{todo[:desciption]}"
    end
    puts "No todos found." if @todos.empty?
  end
end

# Create an instance of the TodoApp and run it
todo_app = TodoApp.new
todo_app.run
