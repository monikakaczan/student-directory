@line_width=50
@students = []
@name
def input_students
  default_values = {
    cohort: "Not sure yet what",
    hobby: "Gaming!",
    age: "Never too old to program",
    height: "just right"
  }

  cohorts = [:january,:february ,:march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

  puts "Please enter the names of the students".center(@line_width)
  puts "To finish, just hit return twice".center(@line_width)
  @name = gets.gsub(/\n/,"")

  while !@name.empty? do
    puts "Please add cohort".center(@line_width)
    cohort = gets.chomp
    if cohort.empty? != true
      while cohorts.include?(cohort) != true
        puts "Error! Error! Please try again"
        cohort = gets.gsub(/\n/,"").to_sym
      end
    else  cohort = default_values[:cohort]
    end

    puts "Please add hobby".center(@line_width)
    hobby = gets.chomp
    if hobby.empty? then hobby = default_values[:hobby] end

    puts "Please add age".center(@line_width)
    age= gets.chomp
    if age.empty? then age = default_values[:age] end

    puts "Please add height".center(@line_width)
    height = gets.chomp
    if height.empty? then height = default_values[:height] end

    @students << {name: @name, cohort: cohort, hobby: hobby, age: age, height: height}

    if @students.count <= 1
      puts "Now we have #{@students.count} student".center(@line_width)
    elsif @students.count > 1
      puts "Now we have #{@students.count} students".center(@line_width)
end
    @name = gets.gsub(/\n/,"")
  end
    @students
end

def print_header
  puts "The students of Villains Academy".center(@line_width)
  puts "-------------".center(@line_width)
end

def print(students)
  if @students.length < 1
    puts nil
  elsif @students.length >= 1
  @students.each.with_index(1) do |student, index|
    puts "#{index}.#{student[:name]}: #{student[:cohort]} cohort, hobby: #{student[:hobby]}, aged: #{student[:age]}, height: #{student[:height]}.".center(@line_width)
  end
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
  puts "Would you like to sort by letter?".center(@line_width)
  answer = gets.chomp
  if answer == "yes"
    sort_students = []
    puts "Pick a letter".center(@line_width)
    choice = gets.chomp
    @students.each do |c|
      if c[:name][0] == choice
        sort_students << c
      else
      end
    end
    puts sort_students
  else
  end
end

def shorter_than_12characters(name)
  puts "Would you like to get names shorter than 12 characters?".center(@line_width)
  answer = gets.chomp
  if answer == "yes" && @name.length < 12
    puts @name
  elsif answer == "no"
    puts "Okay then!".center(@line_width)
  end
end

@students = input_students
print_header
print(@students)
print_footer(@students)
pick_letter(@students)
shorter_than_12characters(@name)
