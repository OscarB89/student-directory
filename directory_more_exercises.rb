@students = [] # an empty array accessible to all methods
require 'CSV'

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "You have successfully selected option 1"
    input_students
  when "2"
    puts "You have successfully selected option 2"
    show_students
  when "9"
    puts 'You have successfully selected option 9, Bye for now!'
    exit # this will cause the program to terminate
  when "3"
    puts "You have successfully selected option 3 and saved the students."
    puts 'Please enter the name of the file you would like to save'
    filename = STDIN.gets.chomp
    save_students(filename)
  when "4"
    puts "You have successfully selected option 4 and loaded the students from the file"
    puts "Please enter the name of the file you would like to load"
    filename = STDIN.gets.chomp
    load_students(filename)
  else
    puts "I don't know what you meant, try again"
  end
end

def push_hash(name)
  @students << {name: name, cohort: :november}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    push_hash(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(filename)
  # open the file for writing
  csv = CSV.open(filename, "w") do |csv|
  # iterate over the array of students
    @students.each do |student|
    #   student_data = [student[:name], student[:cohort]]
    #   csv_line = student_data.join(",")
    #   csv.puts csv_line
    csv << [student[:name], student[:cohort]]
    end
  end
end

def load_students(filename)
  # if CSV.exists?(filename) == false
  #   filename = ("students.csv")
  # end
  CSV.foreach(filename, "r") do |row|
    # csv.readlines.each do |line|
    name, cohort = row
      push_hash(name)
  end
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
