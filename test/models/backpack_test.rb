require "test_helper"

class BackpackTest < ActiveSupport::TestCase
  test "stores contents" do
    backpack = Backpack.new({ "1" => 1 })

    assert_equal({ "1" => 1 }, backpack.contents)
  end

  test "can add pokemon" do
    backpack = Backpack.new({ "1" => 1 })

    backpack.add_pokemon(1)
    
    assert_equal({ "1" => 2 }, backpack.contents)
  end

  test "returns sum of all captured pokemon" do
    backpack = Backpack.new({ "1" => 1, "2" => 7, "3" => 4 })

    assert_equal 12, backpack.total
  end

  test "return sum of specific captured pokemon" do
    backpack = Backpack.new({ "1" => 1, "2" => 7, "3" => 4 })

    assert_equal 7, backpack.count_of(2)
  end
end