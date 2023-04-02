
# create initial admin user

admin_user = User.admin.find_or_initialize_by(
  email: 'admin@example.com'
)

admin_user.first_name = Faker::Name.first_name
admin_user.last_name = Faker::Name.last_name
admin_user.password = 'Example123#'
admin_user.password_confirmation = 'Example123#'
admin_user.save

# create school-admin user
school_admin_user = User.school_admin.find_or_initialize_by(
  email: 'school-admin@example.com'
)

school_admin_user.first_name = Faker::Name.first_name
school_admin_user.last_name = Faker::Name.last_name
school_admin_user.password = 'Example123#'
school_admin_user.password_confirmation = 'Example123#'
school_admin_user.save

# create student user
student_user = User.student.find_or_initialize_by(
  email: 'student@example.com'
)
student_user.first_name = Faker::Name.first_name
student_user.last_name = Faker::Name.last_name
student_user.password = 'Example123#'
student_user.password_confirmation = 'Example123#'
student_user.save

# create school

school = School.new(
  name: Faker::Educator.secondary_school,
  admin_id: school_admin_user.id,
  email: school_admin_user.email,
  address: Faker::Address.full_address
)

school.save

course = school.courses.new(
  name: Faker::Educator.course_name,
  description: 'This course requires you to have a basic knowledge'
)

course.save

batch = course.batches.new(
  name: "Batch #{course.batches.count + 1}",
  school_id: school.id,
  start_time: Time.now + 1.day,
  end_time: Time.now + 7.days
)

batch.save
