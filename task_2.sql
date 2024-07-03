# Название и продолжительность самого длительного трека.

SELECT title, duration FROM tracks
ORDER BY duration DESC
LIMIT 1;

# Названия треков, продолжительность которых не менее 3,5 минут.

SELECT title, duration FROM tracks
WHERE duration >= '00:03:30';

# Названия сборников, вышедших в период с 2018 по 2020 год включительно.

SELECT "name" FROM collections
WHERE release_date >= 2018 AND release_date <= 2020;

# Исполнители, чьё имя состоит из одного слова.

SELECT "name" FROM artists
WHERE "name" NOT LIKE '% %';

# Названия треков, которые содержат слово «мой» или «my».

SELECT title FROM tracks
WHERE title LIKE '%my%' OR title LIKE '%мой%';