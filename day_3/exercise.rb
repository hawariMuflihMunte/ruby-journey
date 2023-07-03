require 'securerandom'

players = [
  {
    "name" => "Hawari",
    "rank" => 8,
    "playable?" => true
  },
  {
    "name" => "Galih",
    "rank" => 8.5,
    "playable?" => true
  },
  {
    "name" => "Iqbal",
    "rank" => 7.5,
    "playable?" => false
  }
]

class DeckCard
  attr_accessor :card_name

  def initialize
    id = SecureRandom.hex(3)
    @card_name = "card_#{id}"
    @cards = []
  end

  def change_name(name = "")
    return if name.empty?

    @card_name = name
  end

  def add_card(card = {})
    return if card.empty?

    @cards.push(card)
  end

  def add_cards(cards = [])
    return if cards.empty?

    @cards.concat(cards)
  end

  def edit_card(query = "", name = "", rank = 0)
    return if query.empty?

    @cards.each { |card|
      if card['name'].downcase == query.downcase
        card['name'] = name unless name.empty?
        card["rank"] = rank unless rank.zero?
      else
        puts "Not Found"
      end
    }
  end

  def delete_card(query = "")
    return if query.empty?

    @cards.delete_if { |card|
      card['name'].downcase == query.downcase
    }
  end

  def list_cards
    @cards.each_with_index { |card, index|
      playable = card['playable?'] ? 'Playable' : 'Not Playable'
      puts "[#{index + 1}] #{card['name']}(#{card['rank']}): #{playable}"
    }
  end

  def show_card(query = "")
    return if query.empty?

    @cards.each { |card|
      if card['name'].downcase == query.downcase
        playable = card['playable?'] ? 'Playable' : 'Not Playable'
        puts "#{card['name']}(#{card['rank']}): #{playable}"
      end
    }
  end
end

card = DeckCard.new

card.add_cards(players)

puts card.card_name
card.list_cards

puts "\n====\n\n"

card.show_card("Iqbal")

