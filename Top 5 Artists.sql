"Top 5 Artists
Spotify SQL Interview Question Data Lemur"

with artist_rank_t as (
SELECT a.artist_name, 
Dense_rank() over(order by count(gr.song_id) desc) as artist_rank
FROM global_song_rank gr
join songs s on gr.song_id = s.song_id
join artists a on s.artist_id = a.artist_id
where gr.rank <= 10
group by a.artist_name)

select artist_name, artist_rank
from artist_rank_t
where artist_rank<=5
;