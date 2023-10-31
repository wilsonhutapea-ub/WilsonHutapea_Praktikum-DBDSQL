use sampel_university;

select * from student;

-- nomor 1
select student.name, department.dept_name
from student
join department
on student.dept_name = department.dept_name;

-- select student.name, student.dept_name from student order by student.dept_name asc;

-- nomor 2
select student.name, department.dept_name, student.tot_cred
from student 
join department
on student.dept_name = department.dept_name
where student.tot_cred > 100
order by student.tot_cred asc;

-- nomor 3
select student.name as student_name, instructor.name as instructor_name
from student
join instructor
on student.dept_name = instructor.dept_name;