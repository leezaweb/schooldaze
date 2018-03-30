def student_method
  puts "\nPlease enter your Student ID:"
  given_id = gets.chomp
  system ('clear')

  if !Student.exists?(id: given_id)
    system('clear')
    puts "That's not a valid student ID"
    interactive
  end

  student_screen(given_id)
end



def student_screen(given_id)
  puts "\nHello #{Student.find(given_id).first_name}"
  puts "You are registered for #{Student.find(given_id).courses.count} courses."
  puts "\nYou can:\n1 - Get your GPA\n2 - View your report card\n3 - Register for a class\n4 - View all classes and teachers\n5 - See total tuition cost\n6 - Drop Course\n7 - Main Screen"
  selection = gets.chomp


  system ('clear')


  if selection == ""
    puts "Invalid selection"
    student_method
  elsif selection == '1'
    Student.find(given_id).get_gpa
    # puts "_________________________________________________"

  elsif selection == '2'
    Student.find(given_id).report_card
    # puts "_________________________________________________"

  elsif selection == '3'
    ##puts all classes with ID
    print_course_with_id
    puts "Which course would you like to register for?"
    id = gets.chomp
    system ('clear')
    if Course.exists?(id: id)
      Student.find(given_id).register_for_class(id)
    else
      puts "That is not a valid course selection..."
    end

  elsif selection == '4'
    Student.find(given_id).my_classes

  elsif selection == '5'
    Student.find(given_id).total_tuition_cost

  elsif selection == '6'
    print_course_with_id
    puts "Which course would you like to drop?"
    id = gets.chomp
    system ('clear')
    if Student.find(given_id).registrations.exists?(course_id: id)
      Student.find(given_id).drop_course(id)
    else
      puts "That is not a valid selection."
      interactive
    end
  elsif selection == '7'
    interactive
  else
    puts "Thats not a valid selection."
    puts "_____________________________________"
    student_screen(given_id)
  end
  puts "_________________________________________________"
  student_screen(given_id)
end

def print_course_with_id
  # binding.pry
  tp Course.all.includes(:teacher), :id, :subject, "teacher" => lambda{|x|"Professor #{x.teacher.last_name}"}
end
