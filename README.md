# Readme
This is a Ruby on Rails application that allows for the creation, and management of Schools, Courses, Batches, and Students by various user types including Admin, School Admin.

# Prerequisite
- Ruby version 2.7.2
- PostgreSQL@14 running on port: 5432
- Rails version 6.1.7 - This can be installed as a gem when bundle install gets done for the first time. 
## Here are the steps to setup the application:
1. **Clone** the application using command on terminal - git clone git@github.com:ahujaak/school-course-application.git
2. **cd emeritus_assignment** and do the **bundle install**
3. Run **rails db:setup** - rails db:setup consists of 3 steps: rails db:create, migrate, and seed.
4. We have created seed data with 3 users with different user types. The user details are mentioned in later steps.
5. Once the above steps done, you will get to see the basic application setup is done, and now you're good to run the server using command **rails s**.
6. **Hit http://localhost:3000** **in your browser**. If you have not specified or configured the Rails application port excplicitly.
7. After http://localhost:3000, you should be able to see a login screen. Kudos! you have successfully setup the applicaiton.
8. Login with different user types, here are the details:
 - Admin:
    email: admin@example.com
    pass: Example123#
 - School Admin
    email: school-admin@example.com
    pass: Example123#
 - Student
    email: student@example.com
    pass: Example123#

9. All the users have different authorites as they were mentioned in task description.
10. Now login and perform the required operations over different entities.


## How to test the APIs?
The application can handle 2 types of requests one is HTML, and another is JSON.

We have not configured any separate authentication for APIs, but that can be used. You can login on the browser and hit the get request APIs from the same browser window itself. It will share the same session in that case, and no other authentication method would be required. But ideally the APIs should have a separate authentication method.
Example: GET http://localhost:3000/schools.json
## Additional info

The application is using Devise for authentication, and CanCanCan for authorisation.
The authorisation rules are:
- An Admin can manage all the resources.
- A School Admin can manage their schools, courses, batches, add students to the batches, approve/decline the enrollment requests.
- Students can view the Schools listed and the courses being provided by those schools. The student can also check the available batches and their timings, and can make an enrollment request to those batches. 

## Have some feedback?

Please share your valueable feedback on akahuja.81@gmail.com
