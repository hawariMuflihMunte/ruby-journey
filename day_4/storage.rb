require 'securerandom'

class Storage
  attr_accessor :storage_name

  def initialize
    @storage_name = 'Storage'
    @contents = []
  end

  private def change_name(name = '')
    return if name.empty?

    @storage_name = name
  end

  private def add_content(content = {})
    return if content.empty?

    @contents.push(content)
  end

  private def edit_content(query = '', new_title = '', new_content = '')
    return if query.empty?

    @contents.each { |content|
      if content['title'].downcase == query.downcase
        content['title'] = new_title unless new_title.empty?
        content['content'] = new_content unless new_content.empty?
      end
    }
  end

  private def delete_content(query = '')
    return if query.empty?

    @contents.delete_if { |content|
      content['title'].downcase == query.downcase
    }
  end

  private def display_content_list
    if !@contents.empty?
      @contents.each_with_index { |content, index|
        puts "[#{index + 1}] #{content['title']} (#{content['id']})\n#{content['content']}\n"
      }
    else
      puts 'No data'
    end
  end

  private def multiline_input
    content = ''
    loop do
      line = gets
      break if line.strip.empty?

      content += line
    end

    content.chomp
  end

  private def edit_selected_content(index)
    selected_content = @contents[index - 1]
    puts "Editing content with index #{index}: #{selected_content['title']}"

    print 'New title (press Enter to skip): '
    new_title = gets.chomp

    print "New content (press Enter twice to finish):\n"
    new_content = multiline_input

    edit_content(selected_content['title'], new_title, new_content)
    puts 'Content updated successfully'
  end

  private def menu_storage_name
    puts 'Set Storage Name'
    puts ''

    new_name = gets.chomp.to_s
    return if new_name == ''

    change_name(new_name)

    puts 'Name changed successfully'
  end

  private def menu_add_content
    puts 'Add content'
    puts ''
    puts 'Format:'
    puts '{'
    puts '  \'id\' => number # Autofill'
    puts '  \'title\' => string'
    puts '  \'content\' => string'
    puts '}'
    puts ''

    print 'title: '
    title_add = gets.chomp.to_s
    puts ''

    print "content (press Enter twice to finish):\n"
    content_add = multiline_input

    id = SecureRandom.hex(3)
    new_content = {
      'id' => id,
      'title' => title_add,
      'content' => content_add
    }

    add_content(new_content)

    puts 'Content added successfully'
  end

  private def menu_edit_content
    loop do
      break puts 'No data' if @contents.empty?
      display_content_list

      print "\nSelect an index (or type 'exit' to return to main menu): "
      input = gets.chomp

      break if input.downcase == 'exit'

      index = input.to_i

      break if index.zero?

      if (1..@contents.length).cover?(index)
        edit_selected_content(index)
      else
        puts 'Invalid index. Please try again.'
      end
    end
  end

  public def run
    choice = ''

    while choice != 'exit' do
      puts "\n# (#{@storage_name}) #"
      puts ''
      puts '[1] Change Storage Name'
      puts '[2] Display Contents'
      puts '[3] Add Content'
      puts '[4] Edit Content'

      puts 'Type \'exit\' to exit'
      print "\n> "
      choice = gets.chomp

      case choice
      # Set Storage Name
      when choice.to_i == 1
        menu_storage_name

      # List Content
      when choice.to_i == 2
        display_content_list

      # Add Content
      when choice.to_i == 3
        menu_add_content

      # Edit Content
      when choice.to_i == 4
        menu_edit_content
      end
    end
  end

end
