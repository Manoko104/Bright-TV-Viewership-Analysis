📺 TV Viewership Analysis

This repository contains an analysis of TV channel viewership patterns across different demographics, provinces, and time buckets. The dataset includes information on channels, customers, viewing times, and durations, enabling insights into content performance and audience preferences.

📂 Project Structure

data/ – Raw and cleaned datasets

notebooks/ – Jupyter notebooks for exploration and analysis

scripts/ – Python scripts for preprocessing, transformation, and visualization

outputs/ – Generated charts, reports, and summary tables

📊 Dataset Description

The dataset contains the following key fields:

CHANNEL2 → Channel name (e.g., Supersport Live Events, Trace TV, Cartoon Network)

total_customers → Number of unique customers viewing the channel

Month_name / Month_id → Time dimension for analysis

Weekday / TIME / Time_Bucket → Viewing patterns by day and hour

hours_of_Duration / Viewership_Duration → Length of time spent watching

Gender, Race, Province, Age_basket → Demographics of viewers

MOM_percentage → Month-over-Month change in customers

📈 Key Insights

Supersport Live Events is the most popular channel, especially among young and middle-aged male viewers.

Trace TV and Channel O attract strong engagement from younger adults (25–35).

Cartoon Network performs well with younger audiences and family segments.

Viewership peaks during afternoon (12:00–16:59) and evening (17:00–21:59) slots.

Highest engagement comes from provinces such as Gauteng, KwaZulu-Natal, and Mpumalanga.

Most views are short (<15 mins) or standard (15–59 mins) in duration, showing both quick engagement and longer retention patterns.

✅ Recommendations

Invest in Sports & Music Channels → Strengthen Supersport, Trace, and Channel O for higher engagement.

Prime Time Focus → Concentrate programming in afternoons and evenings.

Target Young Adults (25–35) → They form the majority of active viewers.

Regional Campaigns → Focus marketing efforts in Gauteng, KZN, and Mpumalanga.

Diversity in Content → Develop content targeting female audiences to balance current male-heavy viewership.

🛠️ Tools & Technologies

Python (pandas, matplotlib, seaborn) for analysis & visualization

Jupyter Notebook for exploration

Excel / CSV as data sources
