json.extract! task, :id, :name, :project_id, :completed, :created_at, :updated_at
json.url task_url(task, format: :json)
