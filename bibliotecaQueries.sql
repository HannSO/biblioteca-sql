-- QUERY 1:
-- "Who checked out the book The Hobbit?"
  select member.name
  from member, book, checkout_item
  where book.title = "The Hobbit"
  and book.id = checkout_item.book_id
  and member.id = checkout_item.member_id;
-- Answer = Anand Beck

 -- QUERY 2:
-- "How many people have not checked out anything?"
  select count(*)
  FROM member
  WHERE member.id
  NOT IN (SELECT member_id from checkout_item);
-- Answer = 37

-- QUERY 3:
"What books and movies aree not checked out?"
  SELECT title FROM movie
  where id
  not in(select movie_id from checkout_item where movie_id is Not Null)
  UNION ALL
  select title from book
  where book.id
  not in (select book_id from checkout_item where book_id is Not Null);

-- Answer =
-- Thin Red Line
-- Crouching Tiger, Hidden Dragon
-- Lawrence of Arabia
-- Office Space
-- Fellowship of the Ring
-- 1984
-- Tom Sawyer
-- Catcher in the Rye
-- To Kill a Mockingbird
-- Domain Driven Design

-- QUERY 4.

-- "Add the book The Pragmatic Programmer, and add yourself as a member.
-- Check out The Pragmatic Programmer. Use your query from question 1 to verify that you have checked it out.
-- Also, provide the SQL used to update the database."

  INSERT INTO book(title)
  VALUES ("The Pragmatic Programmer");

  INSERT INTO member(name)
  VALUES("Hannah Smozbourne");

  INSERT INTO checkout_item(book_id, member_id)
  VALUES(11,43);
--
-- "CHECKING:"
  select member.name
  from member, book, checkout_item
  where book.title = "The Pragmatic Programmer"
  and book.id = checkout_item.book_id
  and member.id = checkout_item.member_id;
-- ANSWER: Hannah Smozbourne

-- QUERY 5.
-- "Who has checked out more that 1 item?"
-- Tip: Research the GROUP BY syntax.
  select name
  from member
  where id
  in(select member_id
  from checkout_item
  group by member_id
  having count(*)>1)

  --Anand Beck
--  Frank Smith




-- ANSWER= 1
-- 6
