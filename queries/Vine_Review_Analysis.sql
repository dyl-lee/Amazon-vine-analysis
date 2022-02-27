-- New table with only rows where total_votes >= 20
SELECT * FROM vine_filtered_totalvotes;

-- New table from vine_filtered_totalvotes with only rows where helpful/total >= 50%. sql division truncates towards zero for integers so cast to float
SELECT * FROM vine_filtered_percentage;

-- New table from vine_filtered_percentage with only rows reviewed by Vine
SELECT * FROM vine_filtered_Y;

-- New table from vine_filtered_percentage with only rows not reviewed by Vine
SELECT * FROM vine_filtered_N;

-- vine_filtered_n total number of reviews
SELECT COUNT(*) AS count_of_N
FROM vine_filtered_n;

-- vine_filtered_n total number of 5-star reviews
SELECT COUNT(*) as count_of_N_5
FROM vine_filtered_n
WHERE star_rating = 5;

-- vine_filtered_n percentage of 5-star reviews 
SELECT star_rating,
    count(star_rating) AS rating_count_N,
    round((count(star_rating)/sum(count(star_rating)) OVER () * 100), 2) as percent_of_total_N
FROM vine_filtered_n
group by star_rating
order by star_rating DESC;

-- vine_filtered_y total number of reviews
SELECT COUNT(*) AS count_of_Y
FROM vine_filtered_y

-- vine_filtered_y total number of 5-star reviews
SELECT COUNT(*) as count_of_Y_5
FROM vine_filtered_y
WHERE star_rating = 5;

-- vine_filtered_y percentage of 5-star reviews 
SELECT star_rating,
    count(star_rating) AS rating_count_Y,
    round((count(star_rating)/sum(count(star_rating)) OVER () * 100), 2) as percent_of_total_Y
FROM vine_filtered_y
group by star_rating
order by star_rating DESC;

-- star rating distribution for all reviews in this dataset
SELECT star_rating,
    count(star_rating) AS rating_count,
    round((count(star_rating)/sum(count(star_rating)) OVER () * 100), 2) as percent_of_total
FROM vine_filtered_percentage
group by star_rating
order by star_rating DESC;

-- NB: window function always performs calculation on the result set after JOIN/WHERE/GROUPBY/HAVING and before ORDER BY, if over() is not specified the entire result set is treated as 1 partition