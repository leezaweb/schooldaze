Student.delete_all
Course.delete_all
Teacher.delete_all
Registration.delete_all

jen = Student.create(first_name:"Jennifer")
richie = Student.create(first_name: "Richard")
billy = Student.create(first_name:"William")

eng101 = Course.create(subject: "English")
hist101 = Course.create(subject: "History")
math101 = Course.create(subject: "Math")


smith = Teacher.create(last_name: "Smith")
miller = Teacher.create(last_name: "Miller")
thomas = Teacher.create(last_name: "Thomas")

eng101.teacher = Teacher.first
hist101.teacher = Teacher.find(2)
math101.teacher = Teacher.last

eng101.save
hist101.save
math101.save

reg1 = Registration.create(student_id:1,course_id:3)
reg2 = Registration.create(student_id:1,course_id:2)
reg3 = Registration.create(student_id:2,course_id:1)
reg4 = Registration.create(student_id:2,course_id:3)
reg5 = Registration.create(student_id:3,course_id:2)
reg6 = Registration.create(student_id:3,course_id:1)
