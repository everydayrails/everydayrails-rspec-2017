json.extract! project, :id, :name, :description, :due_on, :created_at, :updated_at
json.url project_url(project, format: :json)
