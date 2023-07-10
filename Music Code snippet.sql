SELECT *
FROM playlist$


-- 1 Finding how many songs were added each day

SELECT  distinct track_add_date, COUNT(track_add_time) AS songAdded
FROM playlist$
GROUP BY track_add_date


--2 Average, min, max number of tracks on an album

SELECT  AVG(number_of_tracks_in_album) AS Average_number_in_album,MAX(number_of_tracks_in_album) AS Higest_Number_in_track,
MIN(number_of_tracks_in_album) AS lowest_number_in_album
FROM playlist$

--3  Longest, Shortest, average track duration in milliseconds

SELECT MAX(track_duration_ms) AS Longest_track_duration, 
MIN(track_duration_ms) AS Shortest_track_duration, 
AVG(track_duration_ms) AS average_track_duration
From playlist$

-- 3.5. Display Longest, Shortest, average track duration as Minutes

--Minutes
WITH track_durations(track_duration_ms) AS (
	SELECT CAST(track_duration_ms AS NUMERIC)%(1000*60*60)/(1000*60)
 AS 'Track Minutes' FROM playlist$)

SELECT  MAX(track_duration_ms) AS Longest_Duration, MIN(track_duration_ms) AS Shortest_Duration, AVG(track_duration_ms) AS Average_Duration FROM track_durations


--4  top 3 popular artists and their top 3 popular tracks


SELECT top(3) name_of_artists, track_popularity, 
COUNT(track_popularity) AS Occurence, MAX(track_popularity) AS MAX
FROM playlist$
--WHERE track_popularity =100
group by track_popularity, name_of_artists
order by track_popularity desc



--6 top 10 most popular tracks

SELECT DISTINCT TOP(10) name_of_artists, track_popularity,
COUNT(track_popularity) As Occurence, MAX(track_popularity) AS MAX
FROM playlist$
--WHERE track_popularity =100
group by track_popularity, name_of_artists
order by track_popularity desc
