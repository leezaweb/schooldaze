Course.destroy_all
Student.destroy_all
Teacher.destroy_all
Registration.destroy_all


jen = Student.create(first_name:"Jennifer", last_name: "Jones")
richie = Student.create(first_name: "Richard", last_name: "Jupiter")
billy = Student.create(first_name:"William", last_name: "Johnson")
tina = Student.create(first_name:"Tina", last_name: "Shmitty")
kyle = Student.create(first_name:"Kyle", last_name: "Cabo")
leeza = Student.create(first_name:"Leeza", last_name: "Danger")
doug = Student.create(first_name:"Doug", last_name: "Dipp")
chris = Student.create(first_name:"Chris", last_name: "Zingo")
sally = Student.create(first_name:"Sally", last_name: "Lumon")

smith = Teacher.create(first_name: "Joe", last_name: "Smith")
miller = Teacher.create(first_name: "Lisa", last_name: "Miller")
thomas = Teacher.create(first_name: "Frank", last_name: "Thomas")
kelly = Teacher.create(first_name: "Cindy", last_name: "Kelly")
ming = Teacher.create(first_name: "Yu", last_name: "Ming")
sam = Teacher.create(first_name: "Fluke", last_name: "Sam")
doe = Teacher.create(first_name: "John", last_name: "Doe")

eng101 = Course.create(subject: "English", cost: 200, pay: 100, teacher: smith)
hist101 = Course.create(subject: "History", cost: 250, pay: 250, teacher: miller)
math101 = Course.create(subject: "Math", cost: 500, pay: 50, teacher: doe)
cmpsci200 = Course.create(subject: "Computer Science", cost: 725, pay: 1000, teacher: sam)
bootcamp = Course.create(subject: "Bootcamp", cost: 2500, pay: 650, teacher: ming)
sci105 = Course.create(subject: "Science Intermediate", cost: 800, pay: 350, teacher: kelly)
sci101 = Course.create(subject: "Science", cost: 550, pay: 2000, teacher: thomas)

eng101.save
hist101.save
math101.save
cmpsci200.save
bootcamp.save
sci105.save
sci101.save

reg2 = Registration.create(student_id:1,course_id:2, grade: 4)
reg1 = Registration.create(student_id:1,course_id:3, grade: 3)
reg7 = Registration.create(student_id:1,course_id:5, grade: 4)
reg3 = Registration.create(student_id:2,course_id:1, grade: 1)
reg4 = Registration.create(student_id:2,course_id:3)
reg6 = Registration.create(student_id:3,course_id:1, grade: 4)
reg5 = Registration.create(student_id:3,course_id:2, grade: 4)
reg7 = Registration.create(student_id:4,course_id:1, grade: 3)
reg7 = Registration.create(student_id:4,course_id:5)
reg7 = Registration.create(student_id:4,course_id:7, grade: 2)
reg7 = Registration.create(student_id:5,course_id:1)
reg7 = Registration.create(student_id:5,course_id:2, grade: 4)
reg7 = Registration.create(student_id:5,course_id:5)
reg7 = Registration.create(student_id:5,course_id:6)
reg7 = Registration.create(student_id:6,course_id:2, grade: 3)
reg7 = Registration.create(student_id:6,course_id:3, grade: 4)
reg7 = Registration.create(student_id:6,course_id:4, grade: 3)
reg7 = Registration.create(student_id:6,course_id:6, grade: 3)
reg7 = Registration.create(student_id:7,course_id:1, grade: 4)
reg7 = Registration.create(student_id:7,course_id:4, grade: 1)
reg7 = Registration.create(student_id:7,course_id:5, grade: 1)
