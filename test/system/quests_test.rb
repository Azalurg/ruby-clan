require "application_system_test_case"

class QuestsTest < ApplicationSystemTestCase
  setup do
    @quest = quests(:one)
  end

  test "visiting the index" do
    visit quests_url
    assert_selector "h1", text: "Quests"
  end

  test "should create quest" do
    visit quests_url
    click_on "New quest"

    fill_in "Backgrounds", with: @quest.backgrounds
    fill_in "Classes", with: @quest.classes
    fill_in "Description", with: @quest.description
    fill_in "Max level", with: @quest.max_level
    fill_in "Min level", with: @quest.min_level
    fill_in "Name", with: @quest.name
    fill_in "Races", with: @quest.races
    fill_in "Reward exp", with: @quest.reward_exp
    fill_in "Reward level", with: @quest.reward_level
    click_on "Create Quest"

    assert_text "Quest was successfully created"
    click_on "Back"
  end

  test "should update Quest" do
    visit quest_url(@quest)
    click_on "Edit this quest", match: :first

    fill_in "Backgrounds", with: @quest.backgrounds
    fill_in "Classes", with: @quest.classes
    fill_in "Description", with: @quest.description
    fill_in "Max level", with: @quest.max_level
    fill_in "Min level", with: @quest.min_level
    fill_in "Name", with: @quest.name
    fill_in "Races", with: @quest.races
    fill_in "Reward exp", with: @quest.reward_exp
    fill_in "Reward level", with: @quest.reward_level
    click_on "Update Quest"

    assert_text "Quest was successfully updated"
    click_on "Back"
  end

  test "should destroy Quest" do
    visit quest_url(@quest)
    click_on "Destroy this quest", match: :first

    assert_text "Quest was successfully destroyed"
  end
end
