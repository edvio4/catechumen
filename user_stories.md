### Description
My Catechumen app is a homeschool curriculum planning app. This app will help parents keep track what books each student is studying.  It also allows parents to plan the pace of teaching through a book.  This is perhaps it's most useful feature because if a parents wants to finish a book by a given date, this app will help them plan how many lessons and on which days of the week should the parent teach that book.

Being a homeschool parent is already a daunting task so this app will hopefully take the guessing out of planning a student's school year.  


### User stories

## As a user
I want add a student that I’m homeschooling so that I can plan his/her curriculum

## Acceptance Criteria
- I must be able to add a new student from the index page
- I must see error message(s) if I don't include all the necessary information
- I must see an error if I try to enter a student more than once

## As a user
I want see a list of my students I’m homeschooling so that I can plan each student’s curriculum

## Acceptance Criteria
- I must see the name of each student

## As a user
I want to have a page for each student which will contain the launching page for that student

## Acceptance Criteria
- From the list of students page, I must be able to click on a student's name which will take me that student's launching page (show)

## As a user
- I want to be able to see a list of books that are assigned to a student so I know what books a given student is studying

## Acceptance Criteria
- From the student's show page, I must see a link that takes me to a page that shows me a list of book that are assigned to that student

## As a user
I want to be able add a book for a particular student so that I can plan out lessons of that book for my student

## Acceptance Criteria
- On the page that shows the list of books assigned to a student, I must see a link to add a new book for that student
- I must include the title of the book
- I must include the number of lessons in that book
- I must see an error message(s) if I don't include all the necessary information

## As a user
I want to be able to set the recurrence (which days of the week) of a student's book

## As a user
I want to be able set the pace of a book, i.e. how many lessons per days

## As a user
I want to be able to see a calendar (daily, weekly, monthly) view for each student's curriculum

## As a user
From the calendar view, I want to be able to postpone a student's lesson to the next recurrence or if I get ahead on a day, mark a future
as completed. Making these changes will automatically adjust the calendar view to show these changes.

## As a user
I want to be able to delete a student

## As a user
I want to be able  to assign a book to a student’s curriculum

## As a user
I want to be able to un-assign a book from a student


### Link to ER diagram

[link to ER diagram](https://drive.google.com/file/d/0Bz_mIZsSIrw8Wmcyc01GV1NjQ2M/view?usp=sharing)







## As a user
I want to be able to delete a student

## Acceptance Criteria
- On the student list page, next to each student, I should see a "Delete" button
- When I click on the delete button, I must see an alert that asks the user if the user is sure he/she wants to delete the student
- Deleting the student will delete any books assigned to that student
