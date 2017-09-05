require 'rails_helper'

RSpec.describe Game, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
    game = Game.create(name: "Starcraft 2")
    expect(game.name).to eq("Starcraft 2")
    expect(game.slug).to eq("starcraft-2")
    end
  end
end
