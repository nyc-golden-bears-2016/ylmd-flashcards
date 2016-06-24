require_relative 'controller'

controller = Controller.new(ARGV[0])
controller.play_game
