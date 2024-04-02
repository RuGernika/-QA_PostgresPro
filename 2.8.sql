-- Сгенерировать скрипт, который наполняет таблицы произвольными данными (можно с помощью psql, можно с помощью любого языка программирования).
-- Простое решение с использование random() и generate_series()

-- Students (name) - вариация из набора данных имен и фамилий 
-- Students (start_year) - случайная дата из периода 2020 -2024 
-- Courses (title) -  случайные данные из массива, для достижения уникальности, добавим к названию случайное число из диапазона от 10 до 99 
-- Courses (hours) - случайное число из диапазона от 1 до 200 
-- Exams (scope) -  случайное число от 1 до 5

INSERT INTO Students (s_id, name, start_year)
SELECT 
  row_number() OVER () as s_id,
  first_names.first_name || ' ' || last_names.last_name as name,
  TIMESTAMP '2020-01-01' + random() * (TIMESTAMP '2024-12-31' - TIMESTAMP '2020-01-01') AS start_year
FROM 
  (SELECT unnest(ARRAY['Максим', 'Сергей', 'Агафон', 'Петр', 'Ярослав', 'Игнат', 'Николай', 'Глеб', 'Юрия']) AS first_name) AS first_names
CROSS JOIN 
  (SELECT unnest(ARRAY['Иванов', 'Александров', 'Николаев','Пушкин','Толстой','Бунин','Пастернак','Достоевский' ]) AS last_name) AS last_names
LIMIT 50;


INSERT INTO Courses (c_no, title, hours)
select
row_number() OVER () as  c_no,
    title || ' ' || (FLOOR(RANDOM() * 90) + 10) AS title,
    FLOOR(RANDOM() * 200) + 1 AS hours
FROM unnest(ARRAY['Теория вероятности', 'Статистика', 'Дискретный анализ', 'Тестирование', 'Алгоритмы', 'Комбинаторика', 'Программирование', 'Криптография', 'Проектирование ИС']) AS title;



INSERT INTO Exams (s_id, c_no, scope)
SELECT
    (SELECT s_id FROM Students ORDER BY random() LIMIT 1),
    (SELECT c_no FROM Courses ORDER BY random() LIMIT 1),
    (random() * 4 + 1)::int;

