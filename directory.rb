@line_width=50
@students = []

def input_students
  puts "Please enter the names of the students".center(@line_width)
  puts "To finish, just hit return twice".center(@line_width)
  name = gets.gsub(/\n/,"")
  puts "Please add cohort".center(@line_width)
  cohort = gets.gsub(/\n/,"")
  while !name.empty? && !cohort.empty? do
    @students << {name: name, cohort: cohort.to_sym}
      if @students.count <= 1
        puts "Now we have #{@students.count} student".center(@line_width)
      elsif @students.count > 1
        puts "Now we have #{@students.count} students".center(@line_width)
      end
      name = gets.gsub(/\n/,"")
      puts "Please add cohort".center(@line_width)
      cohort = gets.gsub(/\n/,"")
  end
  @students
end

def print_header
  puts "The students of Villains Academy".center(@line_width)
  puts "-------------".center(@line_width)
end

def print(students)
  @students.each.with_index(1) do |student, index|
    puts "#{index}.#{student[:name]} (#{student[:cohort]} cohort)".center(@line_width)
  end
end

def print_footer(students)
  if @students.count <= 1
    puts "Now we have #{@students.count} student".center(@line_width)
  elsif @students.count > 1
    puts "Now we have #{@students.count} students".center(@line_width)
  end
end

def pick_letter(students)
  puts "Would you like to sort by letter?"
  answer = gets.chomp
  if answer == "yes"
    sort_students = []
    puts "Pick a letter"
    choice = gets.chomp
    @students.each do |c|
      if c[:name][0] == choice
        sort_students << c
      else puts "-"
      end
    end
    puts sort_students
  else
    puts "wrong answer, you want to sort by letter!"
  end
end


@students = input_students
print_header
print(@students)
print_footer(@students)
pick_letter(@students)
