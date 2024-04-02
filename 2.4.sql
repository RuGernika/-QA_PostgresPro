INSERT INTO Students (s_id, name, start_year) VALUES 
(1, 'Иванов Иван', '2022-09-01'),
(2, 'Петров Петр', '2024-08-15'),
(3, 'Сидорова Мария', '2024-03-20');

INSERT INTO Courses (c_no, title, hours) VALUES 
    (1, 'Теория вероятности', 120),
    (2, 'Основы тестирования', 200),
    (3, 'Базы данных', 100);


INSERT INTO Exams (s_id, c_no, scope) VALUES 
    (1, 1, 5),
    (1, 2, 5),
    (2, 1, 3),
    (1, 3, 4),
    (2, 2, 4);
