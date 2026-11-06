-- LibraTrack library register: books table and sample data
DROP TABLE IF EXISTS books;
CREATE TABLE books (
    book_id INTEGER PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(80) NOT NULL,
    category VARCHAR(40) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    copies_available INTEGER NOT NULL CHECK (copies_available >= 0)
);

-- 12 fictional book records (prices range from ₹150 to ₹900)
INSERT INTO books (book_id, title, author, category, price, copies_available) VALUES
    (1, 'The Silent River', 'A. Mehta', 'Fiction', 250, 5),
    (2, 'Python Basics', 'R. Shah', 'Technology', 450, 8),
    (3, 'Mystery at Dawn', 'K. Patel', 'Mystery', 320, 0),
    (4, 'World History', 'S. Rao', 'History', 600, 3),
    (5, 'Digital Logic', 'M. Desai', 'Technology', 550, 4),
    (6, 'Garden of Stars', 'N. Joshi', 'Fiction', 180, 6),
    (7, 'The Last Detective', 'P. Kumar', 'Mystery', 390, 2),
    (8, 'Modern Economics', 'J. Shah', 'Education', 700, 1),
    (9, 'Learning SQL', 'T. Iyer', 'Technology', 500, 0),
    (10, 'Poems of Home', 'D. Trivedi', 'Poetry', 150, 7),
    (11, 'Space Explorer', 'V. Nair', 'Science', 850, 2),
    (12, 'The Art of Design', 'H. Shah', 'Art', 900, 1);

-- 10 different SELECT queries (no JOIN, GROUP BY or subqueries)

-- Q01 — All books
SELECT * FROM books ORDER BY book_id;

-- Q02 — Books priced below ₹500
SELECT book_id, title, price FROM books WHERE price < 500 ORDER BY price;

-- Q03 — Technology books costing at least ₹450
SELECT book_id, title, price FROM books WHERE category = 'Technology' AND price >= 450 ORDER BY title;

-- Q04 — Fiction or Mystery books
SELECT book_id, title, category FROM books WHERE category = 'Fiction' OR category = 'Mystery' ORDER BY category, title;

-- Q05 — Titles containing 'The'
SELECT book_id, title FROM books WHERE title LIKE '%The%' ORDER BY title;

-- Q06 — Books priced between ₹300 and ₹700
SELECT book_id, title, price FROM books WHERE price BETWEEN 300 AND 700 ORDER BY price;

-- Q07 — Books with zero copies
SELECT book_id, title, copies_available FROM books WHERE copies_available = 0 ORDER BY book_id;

-- Q08 — Books with more than 3 copies
SELECT book_id, title, copies_available FROM books WHERE copies_available > 3 ORDER BY copies_available DESC;

-- Q09 — Non-technology books costing ₹500 or more
SELECT book_id, title, category, price FROM books WHERE category <> 'Technology' AND price >= 500 ORDER BY price DESC;

-- Q10 — Books in selected categories under ₹600
SELECT book_id, title, category, price FROM books WHERE (category = 'Science' OR category = 'Art' OR category = 'Poetry') AND price < 600 ORDER BY title;