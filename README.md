# Buckets

> A proof-of-concept voice activated event dispatcher.

Written before Siri and ifttt.com, *Buckets* is a Google Voice hack that allows the caller to execute various commands by the action of leaving a voicemail.

Modeled after IRC commands, e.g.:

  /&lt;command&gt; &lt;message&gt;

...Buckets expects a message of the form:

  "&lt;bucket&gt; &lt;message&gt;"

Users can configure buckets – e.g. *todos* or *note* – and for each bucket, register configurable actions. Implemented actions include *tweet*, *blog* and *email*.

## Example Use-Case

1. Call ###-###-###
2. Leave message: *tweet this works*
3. New tweet posted with text *this works*