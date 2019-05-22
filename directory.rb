@line_width=50
def input_students
  puts "Please enter the names of the students".center(@line_width)
  puts "To finish, just hit return twice".center(@line_width)
  students = []
  name = gets.chomp
  puts "Please add cohort".center(@line_width)
  cohort = gets.chomp
  while !name.empty? && !cohort.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students".center(@line_width)
    name = gets.chomp
    puts "Please add cohort".center(@line_width)
    cohort = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(@line_width)
  puts "-------------".center(@line_width)
end

def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}.#{student[:name]} (#{student[:cohort]} cohort)".center(@line_width)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(@line_width)
end

students = input_students
print_header
print(students)
print_footer(students)
