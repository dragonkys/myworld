DROP TABLE Book_table;
CREATE TABLE Book_table (
Booknum NUMBER,
Section VARCHAR2(20),
Title VARCHAR2(20),
Author VARCHAR2(20),
Available CHAR(1)
);
INSERT INTO Book_table (
Booknum, Section, Title, Author, Available
)
VALUES (
121001, 'Classic', 'Iliad', 'Homer', 'Y'
);
INSERT INTO Book_table (
Booknum, Section, Title, Author, Available
)
VALUES (
121002, 'Novel', 'Gone with the Wind', 'Mitchell M', 'N'
);

DROP TABLE Library_table;
CREATE TABLE Library_table (Section VARCHAR2(20));
INSERT INTO Library_table (Section)
VALUES ('Novel');
INSERT INTO Library_table (Section)
VALUES ('Classic');


drop type book_list_t;
drop type book_t;
CREATE OR REPLACE TYPE Book_t AS OBJECT (
Booknum NUMBER,
Title VARCHAR2(20),
Author VARCHAR2(20),
Available CHAR(1)
);
/
CREATE OR REPLACE TYPE Book_list_t AS TABLE OF Book_t;
/

CREATE OR REPLACE VIEW Library_view AS
	SELECT i.Section, CAST (
		MULTISET (
			SELECT b.Booknum, b.Title, b.Author, b.Available
			FROM Book_table b
			WHERE b.Section = i.Section
		) AS Book_list_t
	) BOOKLIST
FROM Library_table i;
