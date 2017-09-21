/* Query 1: Find all movies with Orlando Bloom sorted by year, from oldest to newest */

select tb.title_id, tb.primary_title, tb.start_year, pb.primary_name
from title_basics tb
join principals p on tb.title_id = p.title_id
join person_basics pb on p.person_id = pb.person_id
where pb.primary_name = 'Orlando Bloom'
and tb.title_type = 'movie'
order by tb.start_year asc;

/* Query 2: Find all directors whose name start with the letter A, sorted alphabetically
by director name */

select pb.person_id, pb.primary_name
from person_basics pb
join person_professions pr on pr.person_id = pb.person_id
join directors d on d.person_id = pb.person_id
where SUBSTRING(pb.primary_name,1,1) = 'A'
and pr.profession = 'director'
order by pb.primary_name asc;

/* Query 3: Find all movies whose rating is higher than 9.5, order by high to low */

select tb.title_id, tb.primary_title, tr.average_rating
from title_basics tb
join title_ratings tr on tr.title_id = tb.title_id
where tr.average_rating > 9.5
and tb.title_type = 'movie'
order by tr.average_rating desc;

/* Query 4: Find all movies who have Tom Cruise, sorted by rating (lowest to highest) */

select tb.title_id, tb.primary_title, tb.start_year, pb.primary_name, tr.average_rating
from title_basics tb
join title_ratings tr on tr.title_id = tb.title_id
join principals p on p.title_id = tb.title_id
join person_basics pb on pb.person_id = p.person_id
where pb.primary_name = 'Tom Cruise'
and tb.title_type = 'movie'
order by tr.average_rating asc;

/* Query 5:  Find all adult titles whose writer's name starts with W, sorted by release date from present to past*/

select tb.title_id, tb.primary_title, tb.start_year, pb.primary_name
from title_basics tb
join principals p on p.title_id = tb.title_id
join person_basics pb on pb.person_id = p.person_id
join writers w on w.person_id = pb.person_id
where SUBSTRING(pb.primary_name,1,1) = 'W'
and tb.is_adult = true
order by tb.start_year desc;

/* Query 6: Find all soundtrack personnel in shorts from 2005, sorted by runtime minutes (shortest to longest) */

select pb.primary_name, pr.profession, tb.primary_title, tb.runtime_minutes
from person_basics pb
join principals p on p.person_id = pb.person_id
join person_professions pr on pr.person_id = pb.person_id
join title_basics tb on p.title_id = tb.title_id
join title_ratings tr on tr.title_id = tb.title_id
where tb.title_type = 'short'
and pr.profession = 'soundtrack'
and tb.start_year = 2005
order by tb.runtime_minutes asc;

/* Query 7: Find all TV Episodes that aired after 2007, organized by year released (earliest to latest) */

select tb.title_id, tb.primary_title, tb.start_year, tb.title_type
from title_basics tb
where tb.title_type = 'tvEpisode'
and tb.start_year > 2007
order by tb.start_year asc;

/* Query 8: Find all drama movies */

select tb.title_id, tb.primary_title, tb.start_year, tb.title_type
from title_basics tb
join title_genres tg on tg.title_id = tb.title_id
where tg.genre = 'Drama'
and tb.title_type = 'movie';

/* Query 9: Find all dramatic movies starring Adam Sandler */

select tb.title_id, tb.primary_title, tb.start_year, tb.title_type, tg.genre, pb.primary_name
from title_basics tb
join title_genres tg on tg.title_id = tb.title_id
join stars s on s.title_id = tb.title_id
join person_basics pb on pb.person_id = s.person_id
where tg.genre = 'Drama'
and pb.primary_name = 'Adam Sandler'
and tb.title_type = 'movie';

/* Query 10: Find all actresses who have starred in TV series that ended in 2005, sorted alphabetically */

select pr.profession, pb.primary_name, tb.primary_title, tb.end_year
from person_basics pb
join person_professions pr on pr.person_id = pb.person_id
join stars s on s.person_id = pb.person_id
join title_basics tb on s.title_id = tb.title_id
where pr.profession = 'actress'
and tb.title_type = 'tvSeries'
and tb.end_year = 2005
order by pb.primary_name asc;

/* Query 11: Find all shorts that start with the letter 'X' */

select tb.title_id, tb.primary_title, tb.title_type
from title_basics tb
where tb.title_type = 'short'
and SUBSTRING(tb.primary_title,1,1) = 'X';


/* Query 12: Find all directors that have directed a short in 2003 */

select pr.profession, pb.primary_name, tb.primary_title, tb.start_year
from person_basics pb
join person_professions pr on pr.person_id = pb.person_id
join principals p on p.person_id = pb.person_id
join title_basics tb on p.title_id = tb.title_id
where pr.profession = 'director'
and tb.title_type = 'short'
and tb.start_year = 2003;

/* Query 13: Find all movies with a rating lower than 2.0, sorted from earliest to now*/

select tb.title_id, tb.primary_title, tb.start_year, tr.average_rating
from title_basics tb
join title_ratings tr on tr.title_id = tb.title_id
where tr.average_rating < 2.0
and tb.title_type = 'movie'
order by tb.start_year asc;
/* Query 14: Find all movies that have Johnny Depp in them */

select tb.title_id, tb.primary_title, tb.start_year
from title_basics tb
join principals p on p.title_id = tb.title_id
join person_basics pb on pb.person_id = p.person_id
where pb.primary_name = 'Johnny Depp'
and tb.title_type = 'movie';

/* Query 15: Find all writers that wrote for a comedy that started in 2008 rated higher than a 7, high to low*/

select pb.primary_name, tb.primary_title, tr.average_rating
from person_basics pb
join writers w on w.person_id = pb.person_id
join title_basics tb on w.title_id = tb.title_id
join title_genres tg on tb.title_id = tg.title_id
join title_ratings tr on tr.title_id = tb.title_id
where tg.genre = 'Comedy'
and tr.average_rating > 7
and tb.start_year = 2008
order by tr.average_rating desc;

/* Query 16: Find all soundtrack engineers that have worked in comedy tv series, ordered by rating (high to low) */

select pr.profession, pb.primary_name, tb.primary_title, tr.average_rating
from person_basics pb
join person_professions pr on pr.person_id = pb.person_id
join principals p on p.person_id = pb.person_id
join title_basics tb on p.title_id = tb.title_id
join title_genres tg on tb.title_id = tg.title_id
join title_ratings tr on tr.title_id = tb.title_id
where pr.profession = 'soundtrack'
and tb.title_type = 'tvSeries'
and tg.genre = 'Comedy'
order by tr.average_rating desc;


/* Query 17: Find all news TV episodes aired in 2011 */

select tb.title_id, tb.primary_title, tb.start_year
from title_basics tb
join title_genres tg on tg.title_id = tb.title_id
where tb.title_type = 'tvEpisode'
and tg.genre = 'News'
and tb.start_year = 2011;

/* Query 18: Find all actors that have starred in adult films in 2000 */

select pr.profession, pb.primary_name, tb.primary_title, tb.start_year
from person_basics pb
join person_professions pr on pr.person_id = pb.person_id
join principals p on p.person_id = pb.person_id
join title_basics tb on p.title_id = tb.title_id
where pr.profession = 'actor'
and tb.is_adult = true
and tb.start_year = 2000;


/* Query 19: Find all non-adult titles that have more than 1000 votes on IMDB, sorted by rating, high to low, higher than 8.0*/

select tb.title_id, tb.primary_title, tb.start_year, tr.average_rating, tr.num_votes
from title_basics tb
join title_ratings tr on tr.title_id = tb.title_id
where tb.is_adult = false
and tr.num_votes > 1000
and tr.average_rating > 8.0
order by tr.average_rating desc;

/* Query 19: Find all movies released in 1995 that rated lower than a 3, sorted by rating (lowest to highest)*/

select tb.title_id, tb.primary_title, tb.start_year, tr.average_rating
from title_basics tb
join title_Ratings tr on tr.title_id = tb.title_id
where tr.average_rating < 3
and tb.start_year = 1995
and tb.title_type = 'movie'
order by tr.average_rating asc;

/* Query 20: Find all movies whose original title differs from its primary title  */

select tb.title_id, tb.primary_title, tb.original_title, tb.start_year
from title_basics tb
where tb.title_type = 'movie'
and tb.primary_title != tb.original_title;
