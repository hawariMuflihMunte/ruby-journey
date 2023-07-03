require_relative 'deck_card'

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

card = DeckCard.new
card.add_cards(players)

puts card.card_name
card.list_cards

puts "\n====\n\n"

card.show_card('Iqbal')
