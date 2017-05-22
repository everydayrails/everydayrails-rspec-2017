require 'rails_helper'

RSpec.describe Note, type: :model do
  describe "search message for a term" do
    before do
      user = User.create(
        first_name: "Joe",
        last_name:  "Tester",
        email:      "joetester@example.com",
        password:   "dottle-nouveau-pavilion-tights-furze",
      )

      project = user.projects.create(
        name: "Test Project",
      )

      @note1 = project.notes.create(
        message: "This is the first note.",
        user: user,
      )
      @note2 = project.notes.create(
        message: "This is the second note.",
        user: user,
      )
      @note3 = project.notes.create(
        message: "First, preheat the oven.",
        user: user,
      )
    end

    it "returns notes that match the search term" do
      expect(Note.search("first")).to include(@note1, @note3)
    end

    it "returns an empty collection when no results are found" do
      expect(Note.search("message")).to be_empty
    end
  end
end
