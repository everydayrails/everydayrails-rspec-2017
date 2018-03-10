RSpec.shared_context "project setup" do
  let(:user) {FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, owner: user) }
  let(:task) { project.tasks.create!(name: "Test task") }
end
