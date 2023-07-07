require 'securerandom'

class Storage
  attr_accessor :storage_name

  def initialize
    @storage_name = 'Storage'
    @contents = []
  end

  def change_name(name = '')
    return if name.empty?

    @storage_name = name
  end

  def add_content(content = {})
    return if content.empty?

    @contents.push(content)
  end

  def edit_content(query = '', new_title = '', new_content = '')
    return if query.empty?
    return if changes.empty?

    @contents.each { |content|
      if content['title'].downcase == query.downcase
        content['title'] = new_title unless new_title.empty?
        content['content'] = new_content unless new_content.empty?
      end
    }
  end

  def delete_content(query = '')
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
    title = gets.chomp.to_s
    puts ''

    print 'content: '
    content = gets.chomp.to_s
    puts ''

    id = SecureRandom.hex(3)
    new_content = {
      'id' => id,
      'title' => title,
      'content' => content
    }

    add_content(new_content)

    puts 'Content added successfully'
  end

  private def menu_edit_content
    if !@contents.empty?
      @contents.each_with_index { |content, index|
        puts "(#{index + 1}) #{content['title']}\n\"#{content['content']}\"\n"
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
      puts '[1] Set Storage Name'
      puts '[2] Add Content'
      puts '[3] Edit Content'

      puts 'Type \'exit\' to exit'
      print "\n> "
      choice = gets.chomp

      # Set Storage Name
      if choice.to_i == 1
        set_storage_name
      end

      # Add Content
      if choice.to_i == 2
        menu_add_content
      end

      # Edit Content
      if choice.to_i == 3
        menu_edit_content
      end
    end

  end
end
