
CREATE TABLE Students (
    s_id INT PRIMARY KEY,
    name VARCHAR(255),
    start_year DATE
);


CREATE TABLE Courses (
    c_no INT PRIMARY KEY,
    title VARCHAR(255),
    hours INT
);

CREATE TABLE Exams (
    s_id INT,
    c_no INT,
    scope INT,
    FOREIGN KEY (s_id) REFERENCES Students(s_id),
    FOREIGN KEY (c_no) REFERENCES Courses(c_no)
);

