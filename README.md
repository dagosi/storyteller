# Storyteller

This application is hosted in Heroku. If you need access to it via SSH, please contact me.

## How it works

The application allows certain filtering and grouping. For such actions, you will have to pass
parameters to the URL. You can pass several filters, and one grouping option as parameters to the root URL of these project (https://radiant-dawn-90123.herokuapp.com). For instance, I would like to find an article by a keyword, sort it by content, and group them
by stories:

   https://radiant-dawn-90123.herokuapp.com/?keyword=cyclopean&sort=content&group=story

**NOTE:** There's a slight change of column names in the Articles, and Stories models. Please refer to
them in the code in the schema file.

The following are the params restricted words for each action

 - Search by article name or text (keyword=<title, or content>)
 - Sort on any field (sort=<field>)
 - Group by any field (group=<field>)
 - Group by story with totals:
   - article count (group_totals=article)
   - article type count (group_totals=article_type)
   - last created article (group_totals=last_created)
