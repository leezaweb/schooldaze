class Student < ActiveRecord::Base
  has_many :registrations
  has_many :courses, through: :registrations
    has_many :teachers, through: :courses

  #get tuition cost method (from courses cost)
  def total_tuition_cost
    tuition_cost = courses.inject(0) {|sum, c| sum + c.cost}
    tuition_cost = sprintf( "%0.02f", tuition_cost).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    puts "\nTotal tuition paid: $#{tuition_cost}
      \n"

    # puts tp self.courses,:subject,:cost
    tp self.courses,:subject,:cost
  end

  #get gpa method from registration table grade
  def get_gpa
    total = registrations.where('grade is not null').inject(0){|sum, c| sum + c.grade}
    if total != 0
      # binding.pry
      final_gpa = total.to_f / (self.registrations.where('grade is not null').count).to_f
      self.update(gpa:final_gpa.round(2))
      puts "\nYour total GPA is: #{self.gpa}"
    else
      puts "\nYou dont have any grades yet"
    end

  end

  #shows all subjects and grade- calls get gpa
  def report_card
    puts self.get_gpa
    grades = self.registrations.includes(:course)
    # puts "Your grades for each class are as follows:\n"
    tp grades, {"Subject" => {:display_method => lambda{|x| x.course.subject}}}, :grade
  end

  #register for a course using a course_id
  def register_for_class(course)
    # binding.pry
    if self.registrations.find_by(course_id: course.to_i).nil?
      Registration.create(student_id:self.id, course_id:course.to_i)
    else
      puts "_____________________________________"
      puts "\nYou already registered for that class:"
    end
    registration_table = self.registrations.includes(:course)

    tp registration_table, {"Subject" => {:display_method => lambda{|x| x.course.subject}}}, {"Registered On" => {:display_method => lambda{|x| x.created_at}}}
  end

  def my_classes
    registration_table = self.registrations.includes(:course)
    tp registration_table, {"Subject" => {:display_method => lambda{|x| x.course.subject}}}, {"Teacher Name" => {:display_method => lambda{|x| "Professor " + x.course.teacher.last_name}}}
  end

  def drop_course(course)
    registrations.find_by(course_id:course.to_i).delete
    puts "\nThese are the courses you are still registered for:"
    registration_table = self.registrations.includes(:course)
    tp registration_table, {"Subject" => {:display_method => lambda{|x| x.course.subject}}}, {"Teacher Name" => {:display_method => lambda{|x| "Professor " + x.course.teacher.last_name}}}
  end


end
