use sampel_university;

# SCALAR

# No 1
select concat(i.name, " has a salary of ", i.salary) 'salary' from sampel_university.instructor i;

# No 2
select substring_index(i.dept_name, ' ', 1) "First word of dept_name" from sampel_university.instructor i;

# No 3
select distinct substr(s.dept_name, 2) from sampel_university.student s;

# No 4
select distinct length(s.dept_name) from sampel_university.student s;

# No 5
select distinct replace(s.dept_name, ' ', "[tadinya space]") from sampel_university.student s;

# No 6
select trim("     Trim me       ") "trimmed";

# No 7
select distinct lower(s.dept_name) all_caps from sampel_university.student s;

# AGGREGATE

# No 1
select i.dept_name, sum(i.salary) "Salary Sum" from sampel_university.instructor i group by i.dept_name;

# No 2
select count(c.course_id) "Jumlah course yang ada" from sampel_university.course c;

# No 3
select i.dept_name, avg(i.salary) 'avg salary' from sampel_university.instructor i group by i.dept_name;

# No 4
select i.name, min(i.salary) from sampel_university.instructor i;

# No 5
select c.title, max(c.credits) "max cred" from sampel_university.course c;

# No 6
select * from sampel_university.student s;
select first_value("Manber") over (ORDER BY ID) from sampel_university.student s;

# No 7