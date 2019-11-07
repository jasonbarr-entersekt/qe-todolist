# Manual/Exploratory Testing (front-end)

Followed the instructions to start the node.js instance of the app and verified that it started up.
Followed the instructions to start the app in Docker and verified that it started up.

Open the site on the following platforms:

  * Chrome 77.0.3865.120 Win 10
  * Microsoft Edge 44.18362.387.0 Win 10
  * Firefox 66.0.2-1.fc30
  * Chrome 78.0.3904.62
  * Safari 12.1 on Mojave
  
Resized window/resolution on above platforms where possible.

Refreshed the site multiple times to ensure that records weren't duplicated and that the correct actions were persisted.

Verified that I was re-directed to /todo when entering a randompage or item index that wasn't available.

Clicked submit with no data - rejected and entry not created.

Entered a valid set of input data in the item name field, saved

Generate unicode strings containing characters in the following alphabets:

  * Japanese
  * Chinese
  * Indonesian
  * Arabic (results not right-aligned)
  * Punjabi
  * Cyrilic
  * Korean

Generated strings with ASCII characters, escapes, numerals and emojis.

 * \n\n\n\n\n
 * “\r\t\n”
 * ‘; SHOW table *
 * <i>name</i>
 * !@#$%^&*()
 * <asdf>
 * <script type="text/javascript">document.write(‘No more hotel’)</script>
 * 123
 * 👾 🙇 💁 🙅 🙆 🙋 🙎 🙍
 
Tested inputs with a variety of numerical input standards and currency symbols.

 * 1
 * 111.11
 * 111.1111
 * 11,11
 * 1 111.11
 * 1,111.11
 * R1
 * $1

It's generally not a bad idea to have a look at the strings listed here:

https://github.com/minimaxir/big-list-of-naughty-strings/blob/master/blns.txt

(I tested a lot of the values there and the todolist handled most of them pretty well. Some of the really odd ones weren't wrapped properly, minor issue.)

## Clarification Questions that may result in tickets:

 * Is the site required to work on mobile at this time/ever?
 * Is https required?
 * What stage of development is the site in? Look and feel are very bare bones, some nice-to-have features missing, e.g.    meaningful error messages.
 * Would duplicate entries be considered problematic?

# Automated testing

Consists of pure API tests built with Postman, and UI checks using robotframework.

robotframework tests have a hybrid element built-in; some calls are done using http requests to get the UI in a state which can be checked. Should have used a pure js framework (testcafe, cypress etc.), but more familiar with robot so went with that.

update instructions on how to run each individual set of tests...
