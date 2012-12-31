KnowledgeWeb
============

A RESTful HTML5 webapp to visualise facts and relationships

Notes:

There is a problem with webrick that results in it warning for content length onscript files. Either ignore these warnings or apply the below patch to your webrick:

https://bugs.ruby-lang.org/attachments/2300/204_304_keep_alive.patch

Elected to turn on email confirmation for the Devise user registration steps just to show that it is secure and funky. As a downside if you do not have an SMTP server configured on your localhost the mails are not going to be sent. You can check the debug output in the console to find the confirmation links.

Initial Ideas:

HTML 5 canvas with JQuery pulling relationships from RUBY MVC application.
var ctx = $("#canvas").getContext("2d").{drawing commands}; imageData = ctx.getImageData(0,0,height,width); targetCanvas.getContext("2d").putImageData(imageData,0,0); then use ctx.scale(x,x); ctx.clearRect(0,0,w,h);ctx.drawImage(copiedanvas,0,0);ctx.restore(); to do the zooming operations; 
Initial version should just display current fact and relations, with a click handler to navigate to related facts. A search function to find a link between two facts would also be needed.
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
