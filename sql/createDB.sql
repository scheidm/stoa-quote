CREATE TABLE subsection(
  id int NOT NULL AUTO_INCREMENT,
  description varchar(255) NOT NULL,
  parent_id int,
  tier int,
  PRIMARY KEY (id)
);
CREATE TABLE author(
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE book(
  id int NOT NULL AUTO_INCREMENT,
  title varchar(255) NOT NULL,
  contents int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (contents)
    REFERENCES subsection(id)
);
CREATE TABLE translation(
  id int NOT NULL AUTO_INCREMENT,
  translator_id int NOT NULL,
  book_id int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (translator_id)
    REFERENCES author(id),
  FOREIGN KEY (book_id)
    REFERENCES book(id)
);
CREATE TABLE excerpt(
  id int NOT NULL AUTO_INCREMENT,
  `text  text NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE translation_section(
  id int NOT NULL AUTO_INCREMENT,
  subtitle tinytext,
  `length` int NOT NULL,
  translation_id int NOT NULL,
  subsection_id int NOT NULL,
  start_id int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (translation_id)
    REFERENCES translation(id),
  FOREIGN KEY (subsection_id)
    REFERENCES subsection(id),
  FOREIGN KEY (start_id)
    REFERENCES excerpt(id)
);
CREATE TABLE footnote(
  id int NOT NULL AUTO_INCREMENT,
  excerpt_id int NOT NULL,
  `text  text NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (excerpt_id)
    REFERENCES excerpt(id)
);
CREATE TABLE terminology(
  id int NOT NULL AUTO_INCREMENT,
  name  text NOT NULL,
  preferred boolean DEFAULT FALSE,
  PRIMARY KEY (id)
);

CREATE TABLE thesaurus(
  id int NOT NULL AUTO_INCREMENT,
  word_id int NOT NULL,
  substitute_id int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (word_id)
    REFERENCES terminology(id),
  FOREIGN KEY (substitute_id)
    REFERENCES terminology(id)
);
