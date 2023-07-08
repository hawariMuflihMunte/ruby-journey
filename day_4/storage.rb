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
    @contents.each_with_index { |content, index|
      puts "[#{index + 1}] #{content['title']} (#{content['id']})\n#{content['content']}\n"
    }
  end

  private def multiline_input
    content = ''
    loop do
      line = gets
      break if line.strip.empty?
      content += line
    end

    content
  end

  private def menu_storage_name
    puts 'Set Storage Name'
    puts ''

    new_name = gets.chomp.to_s
    return if new_name == ''

    change_name(new_name)

    puts 'Name changed successfully'
  end

  private def menu_list_contents
    if !@contents.empty?
      @contents.each_with_index { |content, index|
        puts "[#{index + 1}] #{content['title']} (#{content['id']})\n#{content['content']}\n"
      }
    else
      puts 'No data(s) found'
    end
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
    content_add = ''
    loop do
      line = gets
      break if line.strip.empty?
      content_add += line
    end

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
    if !@contents.empty?
      @contents.each_with_index { |content, index|
        puts "[#{index + 1}] #{content['title']} (#{content['id']})\n#{content['content']}\n"

        print "\nSelect an index > "
        index = gets.chomp.to_i

        if index >= 1 && index <= @contents.length
          selected_content = @contents[index - 1]
          puts "Editing content with index #{index}: #{selected_content['title']}"

          puts 'New title (press Enter to skip): '
          new_title = gets.chomp.to_s

          puts "New content (press Enter twice to finish):\n"
          new_content = ''
          loop do
            line = gets
            break if line.strip.empty?
            new_content += line
          end

          new_content.chomp
          edit_content(selected_content['title'], new_title, new_content)

          puts 'Content updated successfully!'
        else
          puts 'Invalid index. Please try again.'
        end
      }
    else
      puts 'No data found'
    end
  end

  def run
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

      # Set Storage Name
      if choice.to_i == 1
        menu_storage_name
      end

      # List Content
      if choice.to_i == 2
        menu_list_contents
      end

      # Add Content
      if choice.to_i == 3
        menu_add_content
      end

      # Edit Content
      if choice.to_i == 4
        menu_edit_content
      end
    end
  end

end
