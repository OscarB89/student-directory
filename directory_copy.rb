def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  puts "Please enter the hobby of your students"
  puts "To finish, just hit return twice"
  # get the first hobby
  hobby = gets.chomp
  # while the name and hobby is not empty
  while !name.empty? && !hobby.empty? do
    # add the student hash to the array
    students << {name: name, hobby: hobby, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    hobby = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  x = 0
  while x < students.count do
    puts "#{students[x][:name]}, with hobby: #{students[x][:hobby]} (#{students[x][:cohort]} cohort)"
    x += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
