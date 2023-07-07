require_relative 'storage'

def run
  storage = Storage.new
  storage.storage_name = 'My Storage'

  choice = ''

  while choice != 'exit' do
    puts "# (#{storage.storage_name}) #"
    puts ''
    puts 'Type \'exit\' to exit'
    puts '[1] Set Storage Name'
    puts '[2] Add Content'
    puts '[3] Edit Content'

    print "\n> "
    choice = gets.chomp
  end
end

run
