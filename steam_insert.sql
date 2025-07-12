set search_path to steam;

INSERT INTO user_account(username, date_created)
VALUES ('cloudStrife7', '2004-11-23'),
       ('c0l0rs', '1997-06-14'),
       ('Donko', '1998-03-09'),
       ('LexxLittle', '2002-11-18');

INSERT INTO friends(username, friends_with, friends_since)
VALUES ('Frostbyte_', '3', '2022-06-03'),
       ('novaa', '1', '2019-11-15'),
       ('Russianbro', '3', '2020-04-02'),
       ('JaySu', '4', '2018-12-10'),
       ('goldd', '2', '2023-06-14'),
       ('dubzyR6S', '4', '2022-11-03'),
       ('klein7', '3', '2024-03-15');

INSERT INTO games(name)
VALUES ('Cyberpunk 2077'), -- open world
       ('DOOM Eternal'), -- FPS
       ('Call Of Duty: Black Ops 2'), -- FPS
       ('Resident Evil 4'), -- Horror
       ('Final Fantasy 7 Rebirth'), -- JRPG
       ('Red Dead Redemption 2'), -- open world
       ('Tekken 8'), -- Fighting game
       ('Mortal Kombat 1'), -- Fighting game
       ('Chrono Trigger'), -- JRPG
       ('The Last Of Us Part 1'), -- Story-game
       ('Dead Space'), -- Horror
       ('Silent Hill 2'); -- Horror


