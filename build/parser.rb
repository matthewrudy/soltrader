require 'json'

class Location
  def initialize(hash)
    @hash = hash
  end

  def identifier
    @hash["identifier"]
  end

  def edges
    @hash['travel_options'].map do |d|
      d['travel_option']['destination_identifier']
    end
  end

  def self.from_board(board)
    board["board"]["locations"].map do |hash|
      Location.new(hash["location"])
    end
  end
end

board = JSON.parse(File.read('board.json'))

Location.from_board(board)

