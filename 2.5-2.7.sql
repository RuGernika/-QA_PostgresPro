-- 1.  Написать запрос, который возвращает всех студентов, которые еще не сдали ни одного экзамена.

SELECT stud.s_id, stud.name FROM Students stud
LEFT JOIN Exams exm ON stud.s_id = exm.s_id WHERE exm.s_id IS NULL;


-- 2. Написать запрос, который возвращает список студентов и количество сданных им экзаменов. Только для студентов, у которых есть сданные экзамены.

SELECT stud.name, COUNT(exm.s_id) AS passed_exams_count FROM Students stud
INNER JOIN Exams exm ON stud.s_id = exm.s_id
GROUP BY stud.name;


-- 3.  Вывести список курсов со средним баллом по экзамену. Список отсортирован по убыванию среднего балла.

SELECT cor.title, AVG(exm.scope) AS average_score_exm 
FROM Courses cor
INNER JOIN Exams exm ON c.c_no = exm.c_no
GROUP BY cor.title
ORDER BY average_score_exm DESC;