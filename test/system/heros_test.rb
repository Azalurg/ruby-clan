require "application_system_test_case"

class HerosTest < ApplicationSystemTestCase
  setup do
    @hero = heros(:one)
  end

  test "visiting the index" do
    visit heros_url
    assert_selector "h1", text: "Heros"
  end

  test "should create hero" do
    visit heros_url
    click_on "New hero"

    fill_in "Background", with: @hero.background_id
    fill_in "Class name", with: @hero.class_name_id
    fill_in "Con", with: @hero.con
    fill_in "Dex", with: @hero.dex
    fill_in "Exp", with: @hero.exp
    fill_in "Free points", with: @hero.free_points
    fill_in "Int", with: @hero.int
    fill_in "Level", with: @hero.level
    fill_in "Name", with: @hero.name
    fill_in "Race", with: @hero.race_id
    fill_in "Str", with: @hero.str
    click_on "Create Hero"

    assert_text "Hero was successfully created"
    click_on "Back"
  end

  test "should update Hero" do
    visit hero_url(@hero)
    click_on "Edit this hero", match: :first

    fill_in "Background", with: @hero.background_id
    fill_in "Class name", with: @hero.class_name_id
    fill_in "Con", with: @hero.con
    fill_in "Dex", with: @hero.dex
    fill_in "Exp", with: @hero.exp
    fill_in "Free points", with: @hero.free_points
    fill_in "Int", with: @hero.int
    fill_in "Level", with: @hero.level
    fill_in "Name", with: @hero.name
    fill_in "Race", with: @hero.race_id
    fill_in "Str", with: @hero.str
    click_on "Update Hero"

    assert_text "Hero was successfully updated"
    click_on "Back"
  end

  test "should destroy Hero" do
    visit hero_url(@hero)
    click_on "Destroy this hero", match: :first

    assert_text "Hero was successfully destroyed"
  end
end
