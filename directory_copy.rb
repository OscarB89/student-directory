def input_students
  puts "Please enter the names of the students, the cohort'months and the hobbies".center(50)
  puts "To finish, just hit return 3 times".center(50)
  # create an empty array
  students = []
  # month_arr = ["january", "february", "march", "avril", "may", "june", "july", "august", "september", "october", "november", "december"]
  months = [:january, :february, :march, :avril, :may, :june, :july, :august, :september, :october, :november, :december]
  # get the first name and month
  name = gets.chomp.to_sym
  cohort = gets.chomp.to_sym
  hobby = gets.chomp.to_sym
  # January default month if month variable is empty
  # cohort = "january" if cohort.empty
  # while the name and hobby is not empty
  while !name.empty? && !hobby.empty? do
  # while month is inappropriate
    while months.include?(cohort) == false
      puts "Please enter an appropriate month"
      cohort = gets.chomp.to_sym
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobby: hobby}
    puts "Now we have #{students.count} students".center(50)
    # get another name from the user
    name = gets.chomp.to_sym
    cohort = gets.chomp.to_sym
    hobby = gets.chomp.to_sym
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  x = 0
  while x < students.count do
    puts "#{students[x][:name]} (#{students[x][:cohort]} cohort) with hobby: #{students[x][:hobby]}".center(50)
    x += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
