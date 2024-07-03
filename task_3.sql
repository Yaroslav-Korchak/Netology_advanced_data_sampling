# Количество исполнителей в каждом жанре.

SELECT COUNT(artistid) AS count_of_artists
FROM artistgenres
GROUP BY genreid;

# Количество треков, вошедших в альбомы 2019–2020 годов.

SELECT COUNT(*) AS count_of_tracks
FROM tracks t
JOIN albums a on t.albumid = a.albumid
WHERE a.release_date >= '2019-01-01' AND a.release_date <= '2020-12-31';

# Средняя продолжительность треков по каждому альбому.

SELECT a.title, AVG(duration) AS average_duration
FROM tracks t
JOIN albums a on t.albumid = a.albumid
GROUP BY a.title

# Все исполнители, которые не выпустили альбомы в 2020 году

SELECT "name"
FROM artists
WHERE artistid NOT IN (SELECT DISTINCT artistid FROM
artistalbums WHERE albumid IN (SELECT albumid FROM albums
WHERE release_date >= '2020-01-01' AND release_date <= '2020-12-31'));

# Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)

SELECT DISTINCT c."name"
FROM collections c
JOIN collectiontracks ct ON c.collectionid = ct.collectionid
JOIN tracks t ON ct.trackid = t.trackid
JOIN artistalbums aa ON t.albumid = aa.albumid
JOIN artists a ON aa.artistid = a.artistid
WHERE a."name" = 'Цветы';