class Storage
  attr_accessor :storage_name

  def initialize
    @storage_name = "Storage"
    @contents = []
  end

  def change_name(name = "")
    return if name.empty?

    @storage_name = name
  end

  def add_content(content = {})
    return if content.empty?
    return if content

    @contents.push(content)
  end

  def edit_content(query = '', changes = {})
    return if query.empty?
    return if changes.empty?

    @contents.each { |content|
      if content['name'].downcase == query.downcase
        content['name'] = changes['name']
      end
    }
  end

  def delete_content(query = "")
    return if query.empty?

    @contents.delete_if { |content|
      content['name'].downcase == query.downcase
    }
  end

  def run
    choice = ''

    while choice != 'exit' do
      puts "# (#{@storage_name}) #"
      puts ''
      puts '[1] Set Storage Name'
      puts '[2] Add Content'
      puts '[3] Edit Content'

      puts 'Type \'exit\' to exit'
      print "\n> "
      choice = gets.chomp

      # Set Storage Name
      if choice.to_i == 1
        puts 'Set Storage Name'
        puts ''

        new_name = gets.chomp.to_s
        return if new_name == ''

        change_name(new_name)

        puts 'Name changed successfully'
      end

      # Add Content
      if choice.to_i == 2

      end

      # Edit Content
      if choice.to_i == 3

      end
    end
  end
end
