require 'test_helper'

class UserCapturePokemonTest < ActionDispatch::IntegrationTest
  test "displays capture message and backpack quantity" do
    Pokemon.create(name: "Pikachu", 
                   image_url: "http://core.dawnolmo.com/50_pokemon__9_pikachu_by_megbeth-d5fga3f_original.png")

    visit root_path

    assert page.has_content?("Backpack: 0")
    
    click_button "Capture"

    assert page.has_content?("You now have 1 Pikachu.")
    assert page.has_content?("Backpack: 1")
  end
end
