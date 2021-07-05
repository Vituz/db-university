-- 1 Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT students.id AS 'student_id', students.name, students.surname, degrees.id AS 'degree_id', degrees.name, degrees.level, degrees.address, degrees.email, degrees.website
FROM `students`
JOIN `degrees`
ON students.degree_id = `degrees`.`id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';


-- 2 Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

SELECT departments.id as 'department_id', departments.name, departments.address, departments.email, departments.website, degrees.id as 'degree_id', degrees.name, degrees.level, degrees.email
FROM `degrees`
JOIN `departments`
ON degrees.department_id = departments.id
WHERE departments.name = 'Dipartimento di Neuroscienze'


-- 3 Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT course_teacher.course_id, courses.name, courses.description, courses.period, courses.cfu, course_teacher.teacher_id, teachers.name, teachers.surname, teachers.email
FROM course_teacher
JOIN courses
ON course_teacher.course_id = courses.id
JOIN teachers
ON course_teacher.teacher_id = teachers.id
WHERE course_teacher.teacher_id = 44;


-- 4 Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT students.id as 'student_id', students.surname, students.name, degrees.id as 'degree_id', degrees.name, degrees.level, degrees.email, degrees.website, departments.id as 'department_id', departments.name, departments.address, departments.phone
FROM students
JOIN degrees
ON students.degree_id = degrees.id
JOIN departments
ON degrees.department_id = departments.id
ORDER BY students.surname ASC;


-- 5 Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT degrees.id as 'degree_id', degrees.name, courses.id as 'course_id', courses.name, teachers.id AS 'teacher_id', teachers.name
FROM degrees
JOIN courses
ON courses.degree_id = degrees.id
JOIN course_teacher
ON course_teacher.course_id = courses.id
JOIN teachers
ON course_teacher.teacher_id = teachers.id
ORDER BY degree_id ASC


-- 6 Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT COUNT(teachers.id) AS number_of_teachers
FROM course_teacher
JOIN courses
ON course_teacher.course_id = courses.id
JOIN teachers
ON course_teacher.teacher_id = teachers.id 
JOIN degrees
ON courses.degree_id = degrees.id
JOIN departments
ON degrees.department_id = departments.id
WHERE departments.name = 'Dipartimento di Matematica'


-- BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
