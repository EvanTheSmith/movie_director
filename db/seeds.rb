t1 = Interest.create(name: "Scrapbooking")
t2 = Interest.create(name: "Gardening")
t3 = Interest.create(name: "Reading")
t4 = Interest.create(name: "Quilting")
t5 = Interest.create(name: "Bingo")

pp1 = Penpal.create(name: "Mabel Addington", age: 83, frequency: "Monthly")
pp1.penpal_interests.create([{interest: t1}, {interest: t2}, {interest: t3}])

pp2 = Penpal.create(name: "Myrtle Garfield", age: 79, frequency: "Monthly")
pp2.penpal_interests.create(interest: t4)

pp3 = Penpal.create(name: "Rosalie Hartford", age: 80, frequency: "Weekly")
pp3.penpal_interests.create([{interest: t3}, {interest: t5}])

pp4 = Penpal.create(name: "Oliver Martin", age: 92, frequency: "Yearly")
pp4.penpal_interests.create([{interest: t2}, {interest: t3}, {interest: t5}])

pp5 = Penpal.create(name: "Arthur Crawford", age: 86, frequency: "Weekly")
pp5.penpal_interests.create(interest: t1)

pp6 = Penpal.create(name: "Fred Durham", age: 65, frequency: "Monthly")
pp6.penpal_interests.create(interest: t2)

pp7 = Penpal.create(name: "Chester Boothe", age: 90, frequency: "Monthly")
pp7.penpal_interests.create([{interest: t2}, {interest: t4}, {interest: t5}])

pp8 = Penpal.create(name: "Agatha Burton", age: 83, frequency: "Weekly")
pp8.penpal_interests.create(interest: t1)

pp9 = Penpal.create(name: "Geraldine Smith", age: 77, frequency: "Yearly")
pp9.penpal_interests.create([{interest: t3}, {interest: t4}])

pp10 = Penpal.create(name: "Edna Kent", age: 86, frequency: "Weekly")
pp10.penpal_interests.create([{interest: t1}, {interest: t3}, {interest: t5}])