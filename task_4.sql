# Названия альбомов, в которых присутствуют исполнители более чем одного жанра

SELECT DISTINCT a.title
FROM albums a
JOIN artistalbums aa ON a.albumid = aa.albumid
JOIN (
    SELECT ag.artistid
    FROM artistgenres ag
    GROUP BY ag.artistid
    HAVING COUNT(DISTINCT ag.genreid) > 1
) multi_genre_artists ON aa.artistid = multi_genre_artists.artistid;

# Наименования треков, которые не входят в сборники.

SELECT t.title
FROM tracks t
LEFT JOIN collectiontracks ct ON t.trackid = ct.trackid
WHERE ct.trackid IS NULL;

# Исполнитель или исполнители, написавшие самый короткий по продолжительности трек,
— теоретически таких треков может быть несколько.

SELECT DISTINCT a."name"
FROM artists a
JOIN artistalbums aa ON a.artistid = aa.artistid
JOIN albums al ON aa.albumid = al.albumid
JOIN tracks t ON al.albumid = t.albumid
WHERE t.duration = (SELECT MIN(duration) FROM tracks);

# Названия альбомов, содержащих наименьшее количество треков.

WITH album_track_counts AS (
    SELECT albumid, COUNT(trackid) AS track_count
    FROM tracks
    GROUP BY albumid
),
min_track_count AS (
    SELECT MIN(track_count) AS min_count
    FROM album_track_counts
)
SELECT al.title
FROM albums al
JOIN album_track_counts atc ON al.albumid = atc.albumid
JOIN min_track_count mtc ON atc.track_count = mtc.min_count;
