require 'rails_helper'

describe "User can view mood and see it refresh" do
  it "retrieves the new mood and displays it" do
    
    visit '/streamers/lirik'
    sleep(12)
    expect(page).to have_content("Tone Analyzer:")
  end
end
