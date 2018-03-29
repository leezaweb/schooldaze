class Teacher < ActiveRecord::Base
  has_many :courses
  has_many :students, through: :courses

  ###GREETING
  def get_salary
    payment_counts = self.courses.joins(:registrations).group(:course_id).count
    payment_amounts = self.courses
    hash = {}

    payment_amounts.each do |course|
      # binding.pry
      hash[course.id] = course.cost * payment_counts[course.id] if payment_counts[course.id]
    end

    salary = sprintf( "%0.02f", hash.values.sum).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse

    puts "\nYour salary this year is $#{salary}."
  end

  ###COURSES
  def add_course
    puts "\nADD COURSE"
    puts "\nCourse Name:"
    subject = gets.chomp
    system('clear')
    puts "\nCourse Cost:"
    cost = gets.chomp
    system('clear')
    puts "\nCourse Pay:"
    pay = gets.chomp
    system('clear')

    Course.create(teacher_id:self.id,subject:subject,cost:cost,pay:pay)
    puts "\nYou added #{subject}"
  end


  def list_courses
    puts "\nLIST COURSES"
    puts "#{self.courses.count} course(s): #{self.courses.pluck(:subject).to_sentence}"
    tp self.courses, :subject, :students => {:display_method => lambda{|x|x.registrations.count}}
  end



  # def most_registrations
  #   most = self.courses.joins(:registrations).group(:course_id).order("count(course_id) DESC").first
  #   puts "\n#{most.subject} has the most registrations: #{most.students.count}"
  #   counter = 0
  #   tp most.students, {"#" =>{:display_method => lambda{|x| counter+=1}}}, {"full_name" =>{:display_method => lambda{|x| "#{x.first_name} #{x.last_name}"}}}
  # end


  ###STUDENTS
  def give_grade
    puts "\nGIVE GRADE"
    puts "\nStudent Name:"
    student = gets.chomp
    system('clear')
    puts "\nCourse Subject:"
    course = gets.chomp
    system('clear')
    puts "\nGrade:"
    grade = gets.chomp
    system('clear')


    student = Student.find_by(first_name:student.split[0])
    course = Course.find_by(subject: course)

    registered = Registration.find_by(student_id:student.id,course_id:course.id)

    if registered && self.students.include?(student) && self.courses.include?(course) && registered.grade.nil?
      registered.update(grade:numeric(grade))
      puts "\n#{student.first_name} #{student.last_name} was given the grade '#{grade}' for #{course.subject}."
    elsif !self.students.include?(student)
      puts "\nError! Not your student."
    elsif !self.courses.include?(course)
      puts "\nError! Not your course."
    elsif !registered
      puts "\n#{student.first_name} #{student.last_name} is not registered for #{course.subject}."
    elsif registered.grade
      puts "\nError! The grade '#{grade}' was previously given to #{student.first_name} #{student.last_name} for #{course.subject}."
    end

  end

  def numeric(letter)
    case letter
      when 'A'
        4
      when 'B'
        3
      when 'C'
        2
      when 'D'
        1
      end

  end



  def list_students
    puts "\nLIST STUDENTS"
    puts "#{self.students.count} student(s): " + self.students.distinct.map{|student| "#{student.first_name} #{student.last_name}"}.to_sentence
    tp self.students.distinct, {"full_name" =>{:display_method => lambda{|x| "#{x.first_name} #{x.last_name}"}}}, {:courses=> {:display_method => lambda{|x|x.courses.select{|x|self.courses.include?(x)}.map{|x|x.subject}.to_sentence}, :width => 360}}
  end


  ###REPORTS
  def profitability
    puts "\nPROFITABILITY"
    tp self.courses, :subject, "$$$" => {:display_method => lambda{|x|profits(x)}}

  end

  def profits(course)
      cost = course.pay
      payment_amounts = course.registrations.count * course.cost
      profit = sprintf( "%0.02f", payment_amounts - cost).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
      payment_amounts - cost < 0 ? resulted_in = "Lost" : resulted_in = "Generated"
      "#{resulted_in} $#{profit.gsub('-','')}."
  end

  def average_grades
    puts "\nAVERAGE GRADES"
    tp self.courses, :subject, "Grade" => {:display_method => lambda{|x|averages(x)}}


  end

  def averages(course)
    if course.registrations && course.registrations.pluck(:grade).any?
      (course.registrations.sum(:grade) / course.registrations.count).to_f
    elsif !course.registrations
      "No students."
    elsif course.registrations.pluck(:grade).none?
      "No grades"
    end

  end








#greetings professor __, your salary is ___

##courses
#   ##add course
#   ##list courses(&registrations)

##students
#   ##give grade
#   ##list students(&classes)

#reports
# #grades
#   ##list average grades
# #profit
#   #list profitability



end
