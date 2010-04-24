
CoffeeScript
------------
* With jQuery's programming model, the syntactic advantages are miniscule

SproutCore
----------
* Wiki was DOWN (PBWorks' fault)
* Apple SUCKS at open-source
* 1.0 final was released **after** I'd written most of the UI.

MongoDB
-------

* Had to implement my own patch for mongoid.

* Crazy mongodb bug after I loaded about 20,000 records from their DB.

    sf ~/Desktop % ruby clone_etsy_db.rb 
    /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/util/bson_c.rb:15:in `deserialize': no c decoder for this type yet (0) (TypeError)
    from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/util/bson_c.rb:15:in `deserialize'
    from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/connection.rb:653:in `read_documents'
    from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/connection.rb:610:in `receive'
    from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/connection.rb:399:in `receive_message'
    from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/connection.rb:397:in `synchronize'
    from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/connection.rb:397:in `receive_message'
    from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/cursor.rb:339:in `send_initial_query'
    from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/cursor.rb:316:in `refill_via_get_more'
    from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/cursor.rb:304:in `num_remaining'
    from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/cursor.rb:312:in `more?'
    from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/cursor.rb:172:in `each'
    from clone_etsy_db.rb:15:in `first'
    from clone_etsy_db.rb:15:in `discover_highest_offset'
    from clone_etsy_db.rb:22

Had to recover by doing:

    sf ~/Desktop % mongo
    MongoDB shell version: 1.2.4
    url: test
    connecting to: test
    type "help" for help
    > use full-etsy-db
    switched to db full-etsy-db
    > db.repairDatabase()
    { "ok" : 1 }
    > bye

this too

INSERTING LISTING WITH listing_id=8122952 AND fetch_offset = 159665
/Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/connection.rb:694:in `send_message_on_socket': Operation failed with the following exception: Broken pipe - send(2) (Mongo::ConnectionFailure)
	from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/connection.rb:342:in `send_message'
	from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/collection.rb:598:in `insert_documents'
	from /Library/Ruby/Gems/1.8/gems/mongo-0.19.1/lib/../lib/mongo/collection.rb:233:in `insert'
	from clone_etsy_db.rb:38
	from /Library/Ruby/Site/1.8/rubygems/custom_require.rb:36:in `each_with_index'
	from clone_etsy_db.rb:35:in `each'
	from clone_etsy_db.rb:35:in `each_with_index'
	from clone_etsy_db.rb:35
	from clone_etsy_db.rb:32:in `step'
	from clone_etsy_db.rb:32
sf ~/Desktop % ruby clone_etsy_db.rb

-----------
When doing > db["full-etsy-db"].find({"listing_id": 7717211}).count()

I got an out of memory error like instantly on my desktop machine (8 core, 8GB RAM).

