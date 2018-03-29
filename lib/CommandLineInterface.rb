

def greet
  puts "Welcome to School, the command line solution to registering for classes and other misc. questions you might have!"
end

def interactive
  puts "\nPlease select one of the following:"

  puts "\n1 - Student\n2 - Teacher\n3 - Exit"
  user_selection = gets.chomp
  system('clear')

  if (user_selection == "")
    interactive
  elsif user_selection == '1'
    puts "_____________________________________"
    student_method
  elsif user_selection == '2'
    puts "_____________________________________"
    teacher_method
  elsif user_selection == '3'
    puts "Have a nice day!"
    exit
  end


end
