# Create teachers #
50.times do
  teacher = User.new(name: Faker::Name.name, email: Faker::Internet.email, role: 'Teacher', password: 'testing', password_confirmation: 'testing')
  p "Teacher: #{teacher.name}; has been created successfully!" if teacher.save
end


# Create Classrooms #
teachers = User.teachers.limit(20)
(["FND", "NUR"] + (1..12).to_a).each do |name|
  classroom = Classroom.new(name: name, teacher_id: teachers.sample.id)
  if classroom.save
    p "Classroom: #{classroom.name} has been created successfully!" 

    5.times do
      subject = classroom.subjects.new(title: Faker::Hacker.noun)
      if subject.save
        p "Classroom: #{classroom.name} has a subject: #{subject.title} now." 
        8.times { subject.topics.create(title: Faker::Hacker.noun) }
      end
    end
  end
end

# Create students #
classrooms = Classroom.all
100.times do
  student = User.new(name: Faker::Name.name, email: Faker::Internet.email, role: 'Student', password: 'testing', password_confirmation: 'testing', classroom_id: classrooms.sample.id)
  p "Student: #{student.name}; has been created successfully!" if student.save
end

# Create Tags #
20.times do 
  Tag.where(name: Faker::Hacker.adjective).first_or_create
end

# Create Resources #
tags = Tag.all
subjects = Subject.where(subjectable_type: 'Classroom')
100.times do 
  resource = Resource.new(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, subject_id: subjects.sample.id)
  if resource.save
    tags.sample(rand(10)).each do |tag|
      resource.taggings.create(tag_id: tag.id)
    end
  end
end

# Create Proficiencies #
classrooms = Classroom.includes(:students, :subjects)
classrooms.each do |classroom|
  students = classroom.students
  subjects = classroom.subjects
  students.each do |student|
    subjects.sample(rand(5)).each do |sub|
      student.proficiencies.create(subject_id: sub.id, marks_in_perc: rand(100))
    end
  end
end
