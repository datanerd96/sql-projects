# Analyze Hacker News Trends

Hacker News is a popular website run by Y Combinator. It serves as a platform for sharing news, projects, and questions within the tech community.

## Understanding the Dataset

### Table Schema: hacker_news

- **title**: the title of the story
- **user**: the user who submitted the story
- **score**: the score of the story
- **timestamp**: the time of the story
- **url**: the link of the story

This dataset is publicly available under the MIT license.

## Queries to Explore Hacker News Trends

### 1. Get a Feel for the hacker_news Table

Start by understanding the contents of the `hacker_news` table.

### 2. Top Five Stories with the Highest Scores

Find the top five stories with the highest scores on Hacker News.

### 3. Investigating the 1-9-90 Rule

Recent studies suggest that a small percentage of users dominate online forums. Explore if this holds true for Hacker News by calculating the total score of all stories.

### 4. Identify Power Users

Pinpoint users with combined scores of more than 200 across their submissions.

### 5. Handling Rickrolling Incidents

Count occurrences of the rickroll video link (`https://www.youtube.com/watch?v=dQw4w9WgXcQ`) posted by offending users.

### 6. Identifying Source Sites

Categorize stories based on their source using a `CASE` statement to identify top contributors like GitHub, Medium, or New York Times.

### 7. Count Stories from Each Source

Enhance the previous query by adding a count of stories from each source using `COUNT()` and `GROUP BY`.

### 8. Best Time to Post a Story

Determine the best time of day to post a story on Hacker News using the `timestamp` column and SQLite's `strftime()` function.

### 9. Hourly Analysis of Scores

Use `strftime()` to analyze scores by hour, calculating average scores and story counts per hour.

### 10. Refining Hourly Analysis

Refine the previous query to round average scores (`ROUND()`) and filter out `NULL` values in timestamps for better clarity.

---

Feel free to execute these queries against the `hacker_news` dataset to uncover trends and insights about submissions on Hacker News. If you have any questions or suggestions, please reach out!

