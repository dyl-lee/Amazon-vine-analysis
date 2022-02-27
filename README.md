# Amazon-vine-analysis

## Overview
The Amazon Vine program allows manufacturers and publishers to receive reviews for their products by paying a fee to Amazon. The program enlists reviewers who are then required to publish a review on the product. This begs the question, is there any bias toward favorable reviews from Vine members?

As an example, ETL process for the video game dataset was retrieved from [Amazon's US reviews dataset](https://s3.amazonaws.com/amazon-reviews-pds/tsv/index.txt) was performed using PySpark. After the data was extracted from the S3 bucket, cleaned and transformed, an AWS RDS instance was connected to load the transformed data into a Postgres database. Finally, several SQL queries were executed to determine whether a bias exists for Vine reviewers publishing favorable reviews.

## Resources
### Software/Services
* pySpark 
* Google Colab Notebook
* pgAdmin 4
* PostgreSQL 14
* Amazon RDS

### Data Sources
* [Amazon US reviews dataset](https://s3.amazonaws.com/amazon-reviews-pds/tsv/index.txt)

## Results
The following questions were addressed based on those reviews that met these criteria:
* Total vote count is greater than or equal to 20 (enriches for reviews more likely to be helpful and avoids any zero-divisions) and,
* Helpful vote rate (i.e. helpful_vote/total_votes) is greater than or equal to 50% (enriches for "favorable" reviews)

### How many Vine reviews and non-Vine reviews were there?
> There were a total of 40565 favorable reviews comprising of 40471 non-Vine reviews and 94 Vine reviews.
> 
> ![Total Reviews](/images/vine_total_reviews.png) 
> ![Total Grouped By Vine](/images/vine_table_vine_breakdown.png)

### How many reviews were 5 stars for each Vine and non-Vine reviewers?
> There were 48 and 15663 5-star Vine and non-Vine reviews, respectively.
> 
> ![Vine 5-star count](/images/vine_filtered_Y_five_star_count.png) 
> ![Non-Vine 5-star count](/images/vine_filtered_N_five_star_count.png) 

### What percentage of reviews were 5 stars for each Vine and non-Vine reviewers? 
> 51.1% of Vine reviews had 5 stars while 38.7% of non-Vine reviews had 5 stars.
> 
> ![Vine 5-star percentage](/images/vine_filtered_Y_five_star_percent.png) 
> ![Non-Vine 5-star percentage](/images/vine_filtered_N_five_star_percent.png)

## Summary
To summarize the numbers generated above, the percentage of star ratings for Vine reviews appears to be unimodal, left-skewed distribution, favoring higher ratings where 51.1% of Vine reviews were 5-star. In comparison, only 38.7% of non-Vine reviews had 5 stars with its bimodal distribution of star ratings around 1 and 5 stars. Preliminary exploration of the video game review dataset suggests that there may be a disincentive to publish negative reviews. Statistical testing is the next logical step to test the null hypothesis, that there is no difference between the mean of the Vine reviews sample and the population, using a one sample t-test. 
