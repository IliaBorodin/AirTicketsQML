function dbInit()
{
    var db = LocalStorage.openDatabaseSync("HomeLab_DB", "", "My database", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS info_flight (departure text,destination text, data text, time text, airplane text, price numeric)')
            // tx.executeSql('CREATE TABLE IF NOT EXISTS info_request (departure text,destination text, data text, time text, surname text, name text)')

        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}

function dbGetHandle()
{
    try {
        var db = LocalStorage.openDatabaseSync("HomeLab_DB", "",
                                               "My database", 1000000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

function dbInsertInfoFlight(departure, destination,data,time,airplane,price)
{
    var db = dbGetHandle()
    var rowid = 0;
    db.transaction(function (tx) {
        tx.executeSql('INSERT INTO info_flight VALUES(?, ?, ?, ?, ?, ?)',
                      [departure, destination, data, time, airplane, price])
        var result = tx.executeSql('SELECT last_insert_rowid()')
        rowid = result.insertId
    })
    return rowid;
}

function dbInsertInfoRequest(departure, destination,data,time,surname,name)
{
    var db = dbGetHandle()
    var rowid = 0;
    db.transaction(function (tx) {
        tx.executeSql('INSERT INTO info_request VALUES(?, ?, ?, ?, ?, ?)',
                      [departure, destination, data, time, airplane, price])
        var result = tx.executeSql('SELECT last_insert_rowid()')
        rowid = result.insertId
    })
    return rowid;
}


function dbReadAllInfoFlight
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT rowid,departure,destination,data,time,airplane,price FROM info_flight order by rowid desc')
        for (var i = 0; i < results.rows.length; i++) {
            listModel.append({
                                 id: results.rows.item(i).rowid,
                                 checked: " ",
                                 departure: results.rows.item(i).departure,
                                 destination: results.rows.item(i).destination,
                                 data: results.rows.item(i).data,
                                 time: results.rows.item(i).time,
                                 airplane: results.rows.item(i).airplane,
                                 price: results.rows.item(i).price,

                             })
        }
    })
}

function dbDeleteInfoFlightRow(id)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('delete from info_flight where rowid = ?', [id])
    })
}

function dbDeleteInfoRequestRow(id)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('delete from info_request where rowid = ?', [id])
    })
}
