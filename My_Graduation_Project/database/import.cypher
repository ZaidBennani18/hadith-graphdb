CREATE CONSTRAINT narrator_id IF NOT EXISTS FOR (n:Narrator) REQUIRE n.id IS UNIQUE;
CREATE CONSTRAINT hadith_id IF NOT EXISTS FOR (n:Hadith) REQUIRE n.id IS UNIQUE;

LOAD CSV WITH HEADERS FROM 'file:///narrators_data.csv' AS row
CREATE (n:Narrator {
    id: toInteger(row.ID),
	name: row.Name,
    fullName: row.`Full Name`,
    birthDate: row.`Birth Date`,
    birthPlace: row.`Birth Place`,
    deathDate: row.`Death Date`,
    deathPlace: row.`Death Place`,
    placesOfStay: row.`Places of Stay`,
	arabicName: row.`Arabic Name`
});


// 1st book


LOAD CSV WITH HEADERS FROM 'file:///jamiAlTirmidhi.csv' AS row
CREATE (h:Hadith {
    id: toInteger(row.id),
    arabic: row.Arabic,
    english: row.English,
    book_number: toInteger(row.Book),
    hadithNumber: toInteger(row.Hadith_number),
	narrators: split(row.Narrators, ","),
	book:"Jami' al-Tirmidhi"
});

LOAD CSV WITH HEADERS FROM 'file:///jamiAlTirmidhi.csv' AS row
MATCH (h:Hadith {id: toInteger(row.id)})
WITH h,toInteger(row.id) as id, split(row.Narrators, ",") AS narrators
MATCH (firstNarrator:Narrator {id: toInteger(narrators[0])})
MERGE (h)-[:NARRATED_BY{hadith_id:id}]->(firstNarrator)
WITH h, id,narrators
UNWIND range(0, size(narrators) - 2) AS i
WITH h, id,toInteger(narrators[i]) AS currentNarratorId, toInteger(narrators[i + 1]) AS nextNarratorId
MATCH (currentNarrator:Narrator {id: currentNarratorId})
MATCH (nextNarrator:Narrator {id: nextNarratorId})
CREATE (currentNarrator)-[:NARRATED_BY{hadith_id:id}]->(nextNarrator);

// 2nd book

LOAD CSV WITH HEADERS FROM 'file:///sahihBukhari.csv' AS row
CREATE (h:Hadith {
    id: toInteger(row.id),
    arabic: row.Arabic,
    english: row.English,
     book_number: toInteger(row.Book),
    hadithNumber: toInteger(row.Hadith_number),
	narrators: split(row.Narrators, ","),
	book:"Sahih Bukhari"
});

LOAD CSV WITH HEADERS FROM 'file:///sahihBukhari.csv' AS row
MATCH (h:Hadith {id: toInteger(row.id)})
WITH h,toInteger(row.id) as id, split(row.Narrators, ",") AS narrators
MATCH (firstNarrator:Narrator {id: toInteger(narrators[0])})
MERGE (h)-[:NARRATED_BY{hadith_id:id}]->(firstNarrator)
WITH h, id,narrators
UNWIND range(0, size(narrators) - 2) AS i
WITH h, id,toInteger(narrators[i]) AS currentNarratorId, toInteger(narrators[i + 1]) AS nextNarratorId
MATCH (currentNarrator:Narrator {id: currentNarratorId})
MATCH (nextNarrator:Narrator {id: nextNarratorId})
CREATE (currentNarrator)-[:NARRATED_BY{hadith_id:id}]->(nextNarrator);


// 3rd book

LOAD CSV WITH HEADERS FROM 'file:///sahihMuslim.csv' AS row
CREATE (h:Hadith {
    id: toInteger(row.id),
    arabic: row.Arabic,
    english: row.English,
     book_number: toInteger(row.Book),
    hadithNumber: toInteger(row.Hadith_number),
	narrators: split(row.Narrators, ","),
	book:"Sahih Muslim"
});

LOAD CSV WITH HEADERS FROM 'file:///sahihMuslim.csv' AS row
MATCH (h:Hadith {id: toInteger(row.id)})
WITH h,toInteger(row.id) as id, split(row.Narrators, ",") AS narrators
MATCH (firstNarrator:Narrator {id: toInteger(narrators[0])})
MERGE (h)-[:NARRATED_BY{hadith_id:id}]->(firstNarrator)
WITH h, id,narrators
UNWIND range(0, size(narrators) - 2) AS i
WITH h, id,toInteger(narrators[i]) AS currentNarratorId, toInteger(narrators[i + 1]) AS nextNarratorId
MATCH (currentNarrator:Narrator {id: currentNarratorId})
MATCH (nextNarrator:Narrator {id: nextNarratorId})
CREATE (currentNarrator)-[:NARRATED_BY{hadith_id:id}]->(nextNarrator);

// 4th book

LOAD CSV WITH HEADERS FROM 'file:///sunanAbiDaud.csv' AS row
CREATE (h:Hadith {
    id: toInteger(row.id),
    arabic: row.Arabic,
    english: row.English,
     book_number: toInteger(row.Book),
    hadithNumber: toInteger(row.Hadith_number),
	narrators: split(row.Narrators, ","),
	book:"Sunan Abi Da'ud"
});

LOAD CSV WITH HEADERS FROM 'file:///sunanAbiDaud.csv' AS row
MATCH (h:Hadith {id: toInteger(row.id)})
WITH h,toInteger(row.id) as id, split(row.Narrators, ",") AS narrators
MATCH (firstNarrator:Narrator {id: toInteger(narrators[0])})
MERGE (h)-[:NARRATED_BY{hadith_id:id}]->(firstNarrator)
WITH h, id,narrators
UNWIND range(0, size(narrators) - 2) AS i
WITH h, id,toInteger(narrators[i]) AS currentNarratorId, toInteger(narrators[i + 1]) AS nextNarratorId
MATCH (currentNarrator:Narrator {id: currentNarratorId})
MATCH (nextNarrator:Narrator {id: nextNarratorId})
CREATE (currentNarrator)-[:NARRATED_BY{hadith_id:id}]->(nextNarrator);

// 5th book

LOAD CSV WITH HEADERS FROM 'file:///sunanAnNasai.csv' AS row
CREATE (h:Hadith {
    id: toInteger(row.id),
    arabic: row.Arabic,
    english: row.English,
     book_number: toInteger(row.Book),
    hadithNumber: toInteger(row.Hadith_number),
	narrators: split(row.Narrators, ","),
	book:"Sunan an-Nasa'i"
});

LOAD CSV WITH HEADERS FROM 'file:///sunanAnNasai.csv' AS row
MATCH (h:Hadith {id: toInteger(row.id)})
WITH h,toInteger(row.id) as id, split(row.Narrators, ",") AS narrators
MATCH (firstNarrator:Narrator {id: toInteger(narrators[0])})
MERGE (h)-[:NARRATED_BY{hadith_id:id}]->(firstNarrator)
WITH h, id,narrators
UNWIND range(0, size(narrators) - 2) AS i
WITH h, id,toInteger(narrators[i]) AS currentNarratorId, toInteger(narrators[i + 1]) AS nextNarratorId
MATCH (currentNarrator:Narrator {id: currentNarratorId})
MATCH (nextNarrator:Narrator {id: nextNarratorId})
CREATE (currentNarrator)-[:NARRATED_BY{hadith_id:id}]->(nextNarrator);


// 6th book
LOAD CSV WITH HEADERS FROM 'file:///sunanIbnMajah.csv' AS row
CREATE (h:Hadith {
    id: toInteger(row.id),
    arabic: row.Arabic,
    english: row.English,
     book_number: toInteger(row.Book),
    hadithNumber: toInteger(row.Hadith_number),
	narrators: split(row.Narrators, ","),
	book:"Sunan Ibn Majah"
});

LOAD CSV WITH HEADERS FROM 'file:///sunanIbnMajah.csv' AS row
MATCH (h:Hadith {id: toInteger(row.id)})
WITH h,toInteger(row.id) as id, split(row.Narrators, ",") AS narrators
MATCH (firstNarrator:Narrator {id: toInteger(narrators[0])})
MERGE (h)-[:NARRATED_BY{hadith_id:id}]->(firstNarrator)
WITH h, id,narrators
UNWIND range(0, size(narrators) - 2) AS i
WITH h, id,toInteger(narrators[i]) AS currentNarratorId, toInteger(narrators[i + 1]) AS nextNarratorId
MATCH (currentNarrator:Narrator {id: currentNarratorId})
MATCH (nextNarrator:Narrator {id: nextNarratorId})
CREATE (currentNarrator)-[:NARRATED_BY{hadith_id:id}]->(nextNarrator);
