json.extract! enrollment_request, :id, :batch_id, :student_id, :status, :created_at, :updated_at
json.url enrollment_request_url(enrollment_request, format: :json)
