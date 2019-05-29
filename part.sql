USE test;

DROP TABLE IF EXISTS part;
CREATE TABLE part(
    id INT(11) NOT NULL AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    need BIT(1) NOT NULL,
    count INT(4) NOT NULL,
    PRIMARY KEY (id)
)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8;

INSERT INTO part (name, need, count)
VALUES ('part01', 0, 1)
     ,  ('part02', 1, 2)
     ,  ('part03', 0, 3)
     ,  ('part04', 1, 4)
     ,  ('part05', 0, 5)
     ,  ('part06', 1, 6)
     ,  ('part07', 0, 7)
     ,  ('part08', 1, 8)
     ,  ('part09', 1, 9)
     ,  ('part10', 0, 10)
     ,  ('part11', 1, 11)
     ,  ('part12', 0, 12)
     ,  ('part13', 1, 13)
     ,  ('part14', 1, 14)
     ,  ('part15', 0, 15)
     ,  ('part16', 1, 16)
     ,  ('part17', 0, 17)
     ,  ('part18', 1, 18)
     ,  ('part19', 0, 19)
     ,  ('part20', 0, 20)
     ,  ('part21', 0, 21)
     ,  ('part22', 0, 22)
     ,  ('part23', 1, 23)
     ,  ('part24', 1, 24)
     ,  ('part25', 0, 25)
     ,  ('part26', 0, 26)
     ,  ('part27', 1, 27)
     ,  ('part28', 1, 28)
     ,  ('part29', 1, 29)
     ,  ('part30', 0, 30)
     ,  ('part31', 0, 31)
     ,  ('part32', 1, 32)
     ,  ('part33', 1, 33)
     ,  ('part34', 0, 34)
     ,  ('part35', 1, 35)
     ,  ('part36', 0, 36)
     ,  ('part37', 1, 37)
     ,  ('part38', 1, 38)
     ,  ('part39', 1, 39)
     ,  ('part40', 0, 40);
