USE krg_3a;
CREATE TABLE employee (
    empid INT PRIMARY KEY,
    ename VARCHAR(50),
    department VARCHAR(50),
    managerid INT
);

INSERT INTO employee (empid, ename, department, managerid) VALUES 
(1, 'Alice', 'HR', NULL),
(2, 'Bob', 'Finance', 1),
(3, 'Charlie', 'IT', 1),
(4, 'David', 'Finance', 2),
(5, 'Eve', 'IT', 3),
(6, 'Frank', 'HR', 1);

SELECT 
    T.ename AS 'Employee Name',
    T.department AS 'Employee Department',
    T1.ename AS 'Manager Name',
    T1.department AS 'Manager Department'
FROM 
    employee T
LEFT JOIN 
    employee T1 ON T.managerid = T1.empid;


-- Experiment 2 (b)


CREATE TABLE Year_tbl (
    ID INT,
    YEAR INT,
    NPV INT
);

CREATE TABLE Queries (
    ID INT,
    YEAR INT
);

INSERT INTO Year_tbl (ID, YEAR, NPV)
VALUES
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

INSERT INTO Queries (ID, YEAR)
VALUES
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

SELECT 
    T.ID,
    T.YEAR,
    IFNULL(T1.NPV, 0) AS NPV
FROM 
    Queries T
LEFT JOIN 
    Year_tbl T1 ON T.ID = T1.ID AND T.YEAR = T1.YEAR;