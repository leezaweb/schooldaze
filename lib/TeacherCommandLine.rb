def teacher_method
  puts "Please enter your Teacher ID:".center(82)
  given_id = gets.chomp
  system('clear')
  if Teacher.exists?(given_id) && given_id.scan(/\D/).empty?
    user = Teacher.find(given_id)
    puts "\nHello, Professor #{user.last_name}!"
    user.get_salary
    teacher_screen(user)
  else
    puts "❌  Invalid Teacher ID".red.blink.center(90)
    puts "__________________________________________________________________________".center(82)
    teacher_method
  end
end

def teacher_screen(user)
  puts "\nPlease select one of the following.\n\t1 - Courses\n\t2 - Students\n\t3 - Reports\n\t4 - Return to Main Screen"
  teacher_choice = gets.chomp
  system('clear')

  puts "__________________________________________________________________________"
  case teacher_choice
    when "1"
      courses_screen(user)
    when "2"
      students_screen(user)
    when "3"
      reports_screen(user)
    when "4"
      interactive
    else
      puts "❌  Invalid choice".red.blink
      puts "__________________________________________________________________________"
      teacher_screen(user)
  end
end

def courses_screen(user)
  puts "\nCOURSES\n   You can:\n\t1 - Add Course\n\t2 - List Courses\n\t3 - Return to Main Screen"
  courses_choice = gets.chomp
  system('clear')
  case courses_choice
    when "1"
      user.add_course
    when "2"
      user.list_courses
    when "3"
      interactive
    else
      puts "❌  Invalid choice".red.blink
  end
  puts "__________________________________________________________________________"
  teacher_screen(user)
end

def students_screen(user)
  puts "\nSTUDENTS\n   You can:\n\t1 - Give Grade\n\t2 - List Students\n\t3 - Return to Main Screen"
  students_choice = gets.chomp
  system('clear')
  case students_choice
    when "1"
      user.give_grade
    when "2"
      user.list_students
    when "3"
      interactive
    else
      puts "❌  Invalid choice".red.blink
  end
  puts "__________________________________________________________________________"
  teacher_screen(user)
end


def reports_screen(user)
  puts "\nREPORTS\n   Please select one of the following.\n\t1 - Average Grades\n\t2 - Profitability\n\t3 - Return to Main Screen"
  reports_choice = gets.chomp
  system('clear')
  case reports_choice
    when "1"
      user.average_grades
    when "2"
      user.profitability
    else
      puts "❌  Invalid choice".red.blink
  end
  puts "__________________________________________________________________________"
  teacher_screen(user)
end
