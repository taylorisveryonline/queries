PREFIX dbp: <http://dbpedia.org/property/>
PREFIX rdf:	<http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs:	<http://www.w3.org/2000/01/rdf-schema#>
PREFIX yago: <http://dbpedia.org/class/yago/>

# Find typefaces in DBpedia using established RDF types, organize by typeface classification/letterform

SELECT DISTINCT ?typeface ?typeLabel ?letterform
WHERE {
	VALUES ?rdftype {
		yago:Type106825120
		yago:WikicatTypefaces
		yago:Font106825399
		}
	?typeface rdf:type ?rdftype;
	   dbp:style ?letterform;
	   rdfs:label ?typeLabel.
	FILTER langMatches(lang(?typeLabel),"en")
}
ORDER BY ?letterform
