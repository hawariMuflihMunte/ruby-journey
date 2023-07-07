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
    return if changes.empty?

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
        set_storage_name
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
