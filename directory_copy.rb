def input_students
  puts "Please enter the names of the students, the cohort'months and the hobbies".center(50)
  puts "To finish, just hit return 3 times".center(50)
  # create an empty array
  students = []
  # month_arr = ["january", "february", "march", "avril", "may", "june", "july", "august", "september", "october", "november", "december"]
  months = [:january, :february, :march, :avril, :may, :june, :july, :august, :september, :october, :november, :december]
  # get the first name and month
  name = gets.strip.to_sym
  cohort = gets.strip.to_sym
  hobby = gets.strip.to_sym
  # January default month if month variable is empty
  # cohort = "january" if cohort.empty
  # while the name and hobby is not empty
  while !name.empty? && !hobby.empty? do
  # while month is inappropriate
    while months.include?(cohort) == false
      puts "Please enter an appropriate month".center(50)
      cohort = gets.strip.to_sym
    end
    # add the student hash to the array
    students << {name: name, cohort: cohort, hobby: hobby}
    if students.count == 1
      puts "Now we have #{students.count} student".center(50)
    else
      puts "Now we have #{students.count} students".center(50)
    end
    # get another name from the user
    name = gets.strip.to_sym
    cohort = gets.strip.to_sym
    hobby = gets.strip.to_sym
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  puts "What month do you want to display?".center(50)
  user_input = gets.strip.to_sym

  sorted_by_cohort = {}

  students.each do |new_students|
    cohort = new_students[:cohort]
    students = new_students[:name]

    if sorted_by_cohort[cohort] == nil
      sorted_by_cohort[cohort] = [students]
    else
      sorted_by_cohort[cohort].push(students)
    end
  end
  puts sorted_by_cohort[user_input]
  # x = 0
  # while x < students.count do
  #   puts "#{students[x][:name]} (#{students[x][:cohort]} cohort) with hobby: #{students[x][:hobby]}".center(50)
  #   x += 1
  # end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student".center(50)
  else
    puts "Overall, we have #{students.count} great students".center(50)
  end
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
