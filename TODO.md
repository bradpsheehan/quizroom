* make different chats per class room
  X generate channels for each chat
    X public channel
    X teacher channel
  * subscribe to the right channel based on the the user (student? or teacher?)
    X teacher subscribes to public channel
    X student subscribes to public channel
    * student sees their own messages
  X publish to the right channel based on the the user (student? or teacher?)
    X teacher publishes to public channel
    X student publishes to public channel
      X teacher sees who answered
    * student publishes to quiz_channel
    * find out how to test that one student cannot see another student post
* add tokens so only teachers can publish to the entire classroom
  * maybe...
* CLEAN UP THE SPECS
* figure out how to make it so students can see their own answers (and results)
* add tokens so only teachers can view student responses
* use factories or fixtures
