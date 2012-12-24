KnowledgeWeb
============

A RESTful HTML5 webapp to visualise facts and relationships

Initial Ideas:

HTML 5 canvas with JQuery pulling relationships from RUBY MVC application.
Userlevel security to restrict facts to individual users.
http://www.ruby-toolbox.com/categories/rails_authorization.html
GameMaster role to allow some users to see all other character's facts.
GameMaster can write facts which are visible to all.
Websockets to trigger refreshes? Or just send the payload via websockets?

Facts made up of relationships noun1, verb/adjective, noun2
Possibly extend to have inventory management and drag and drop trading?
Could work character sheets in as well and recording of advancements and perk increases.
Inventory is just weaponry because of simplified rules.
Character stats are easy, traits and virtues will have to be a separate normalised table.
