#!/usr/bin/env ruby

require_relative "../lib/tictactoe"

computer = ComputerPlayer.new("X")
human = HumanPlayer.new("O")

game = Tictactoe.new([computer, human])

game.play_the_game
winner = game.winner

if winner.nil?
  puts "Draw"
else
  puts "Winner: #{winner.mark}"
end
