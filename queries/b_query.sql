-- (b)
-- Print all actors from the movie The Dark Knight and sort by ascending actor name.
-- No need to specify asc in the order by because it is using asc by default.

SELECT name
FROM actors
         join movies on actors.mid = movies.mid and movies.title = 'The Dark Knight'
ORDER BY name

/*
Execution time: 20ms

+-------------------------+
|name                     |
+-------------------------+
|Aaron Eckhart            |
|Adam Kalesperis          |
|Aidan Feore              |
|Andrew Bicknell          |
|Andy Luther              |
|Anthony Michael Hall     |
|Ariyon Bakare            |
|Beatrice Rosen           |
|Bill Smille              |
|Brandon Lambdin          |
|Bronson Webb             |
|Chin Han                 |
|Christian Bale           |
|Chucky Venn              |
|Cillian Murphy           |
|Colin McFarlane          |
|Craig Heaney             |
|Crhis Perschler          |
|Dale RIvera              |
|Daryl Satcher            |
|David Dastmalchian       |
|Doug Ballard             |
|Edison Chen              |
|Eric Roberts             |
|Erik Hellman             |
|Gary Oldman              |
|Gertrude Kyles           |
|Grahame Edwards          |
|Greg Beam                |
|Hannah Gunn              |
|Heath Ledger             |
|Helene Wilson            |
|Ian Pirie                |
|James Farruggio          |
|James Fierro             |
|James Scales             |
|Jennifer Knox            |
|Jonathan Ryland          |
|Joseph Luis Caballero    |
|Joshua Harto             |
|Joshua Rollins           |
|K. Todd Freeman          |
|Keith Kupferer           |
|Lanny Lutz               |
|Lateef Lovejoy           |
|Lorna Gayle              |
|Maggie Gyllenhaal        |
|Matt Rippy               |
|Matt Shallenberger       |
|Matthew Leitch           |
|Matthew O'Neill          |
|Melinda McGraw           |
|Michael Andrew Gorman    |
|Michael Caine            |
|Michael Corey Foster     |
|Michael Jai White        |
|Michael Stoyanov         |
|Michael Vieau            |
|Monique Curnen           |
|Morgan Freeman           |
|Nancy Crane              |
|Nathan Gamble            |
|Nestor Carbonell         |
|Nigel Carrington         |
|Nydia Rodriguez Terracina|
|Olumiji Olawumi          |
|Patrick Clear            |
|Paul Birchard            |
|Peter DeFaria            |
|Philip Bulcock           |
|Richard Dillane          |
|Ritchie Coster           |
|Roger Monk               |
|Ron Dean                 |
|Ronan Summers            |
|Sam Derence              |
|Sarah Jayne Dunn         |
|Sophia Hinshelwood       |
|Thomas Gaitsch           |
|Thomas McElroy           |
|Tommy 'Tiny' Lister      |
|Tommy Campbell           |
|Tristan Tait             |
|Vincent Riotta           |
|Vincenzo Nicoli          |
|Wai Wong                 |
|Walter Lewis             |
|Will Zahrn               |
|William Armstrong        |
|William Fichtner         |
|Winston Ellis            |
+-------------------------+
*/
