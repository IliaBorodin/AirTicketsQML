function dbInit()
{
    var db = LocalStorage.openDatabaseSync("HomeLab_DB", "", "My database", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS info_flight (departure text,destination text, data text, time text, airplane text, price numeric)')
            //tx.executeSql('CREATE TABLE IF NOT EXISTS info_request (departure text,destination text, data text, time text, surname text, name text)')

        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}
function dbInit2()
{
    var db = LocalStorage.openDatabaseSync("HomeLab_DB", "", "My database", 1000000)
    try {
        db.transaction(function (tx) {
            //tx.executeSql('CREATE TABLE IF NOT EXISTS info_flight (departure text,destination text, data text, time text, airplane text, price numeric)')
            tx.executeSql('CREATE TABLE IF NOT EXISTS info_request (departure text,destination text, data text, time text, surname text, name text)')

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
                      [departure, destination, data, time, surname, name])
        var result = tx.executeSql('SELECT last_insert_rowid()')
        rowid = result.insertId
    })
    return rowid;
}


function dbReadAllInfoFlight()
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT rowid,departure,destination,data,time,airplane,price FROM info_flight order by rowid ')
                    listModel.clear()
        for (var i = 0; i < results.rows.length; i++) {
            listModel.append({
                                 rowidF: results.rows.item(i).rowid,
                                 departureF: results.rows.item(i).departure,
                                 destinationF: results.rows.item(i).destination,
                                 dateF: results.rows.item(i).data,
                                 timeF: results.rows.item(i).time,
                                 airplaneF: results.rows.item(i).airplane,
                                 priceF: results.rows.item(i).price,

                             })
        }
    })
}

function dbReadAllInfoReq()
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT rowid,departure,destination,data,time,surname,name FROM info_request order by rowid ')
                    listModelR.clear()
        for (var i = 0; i < results.rows.length; i++) {
            listModelR.append({
                                 rowidReq: results.rows.item(i).rowid,
                                 departureReq: results.rows.item(i).departure,
                                 destinationReq: results.rows.item(i).destination,
                                 dateReq: results.rows.item(i).data,
                                 timeReq: results.rows.item(i).time,
                                 surnameReq: results.rows.item(i).surname,
                                 nameReq: results.rows.item(i).name,

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

function dbPickFlight(id){
    var db = dbGetHandle()
    db.transaction(function(tx){
        var departure = tx.executeSql('SELECT departure from info_request where rowid = ?', [id]).rows.item(0).departure
        var destination =  tx.executeSql('SELECT destination from info_request where rowid = ?', [id]).rows.item(0).destination
        var results = tx.executeSql(
                    'SELECT rowid,departure,destination,data,time,airplane,price FROM info_flight where departure = ? and destination = ?  order by rowid ',[departure, destination])
         listModel.clear()
         for (var i = 0; i < results.rows.length; i++) {
            listModel.append({
                                 rowidF: results.rows.item(i).rowid,
                                 departureF: results.rows.item(i).departure,
                                 destinationF: results.rows.item(i).destination,
                                 dateF: results.rows.item(i).data,
                                 timeF: results.rows.item(i).time,
                                 airplaneF: results.rows.item(i).airplane,
                                 priceF: results.rows.item(i).price,

                             })
        }
    })
}

function dbFilterDateTime(date, time){

    if(date !="" && time==""){
        dbFilterDate(date)
        return
    }
    else if(date =="" && time !=""){
        dbFilterTime(time)
        return
    }
    else if (date =="" && time ==""){
        return
    }
    var db = dbGetHandle()
    db.transaction(function(tx){
        var results = tx.executeSql(
                    'SELECT rowid,departure,destination,data,time,surname,name FROM info_request where data = ? and time = ?  order by rowid ',[date, time])
          listModelR.clear()
          for (var i = 0; i < results.rows.length; i++) {
            listModelR.append({
                                 rowidReq: results.rows.item(i).rowid,
                                 departureReq: results.rows.item(i).departure,
                                 destinationReq: results.rows.item(i).destination,
                                 dateReq: results.rows.item(i).data,
                                 timeReq: results.rows.item(i).time,
                                 surnameReq: results.rows.item(i).surname,
                                 nameReq: results.rows.item(i).name,

                             })
        }
    })

}

function dbFilterDate(date){
    var db = dbGetHandle()
    db.transaction(function(tx){
        var results = tx.executeSql(
                    'SELECT rowid,departure,destination,data,time,surname,name FROM info_request where data = ? order by rowid ',[date])
          listModelR.clear()
          for (var i = 0; i < results.rows.length; i++) {
            listModelR.append({
                                 rowidReq: results.rows.item(i).rowid,
                                 departureReq: results.rows.item(i).departure,
                                 destinationReq: results.rows.item(i).destination,
                                 dateReq: results.rows.item(i).data,
                                 timeReq: results.rows.item(i).time,
                                 surnameReq: results.rows.item(i).surname,
                                 nameReq: results.rows.item(i).name,

                             })
        }
    })

}

function dbFilterTime(time){
    var db = dbGetHandle()
    db.transaction(function(tx){
        var results = tx.executeSql(
                    'SELECT rowid,departure,destination,data,time,surname,name FROM info_request where time = ?  order by rowid ',[time])
          listModelR.clear()
          for (var i = 0; i < results.rows.length; i++) {
            listModelR.append({
                                 rowidReq: results.rows.item(i).rowid,
                                 departureReq: results.rows.item(i).departure,
                                 destinationReq: results.rows.item(i).destination,
                                 dateReq: results.rows.item(i).data,
                                 timeReq: results.rows.item(i).time,
                                 surnameReq: results.rows.item(i).surname,
                                 nameReq: results.rows.item(i).name,

                             })
        }
    })

}



function dbFilterFlight(departure, destination){
    if (destination =="" && departure!=""){
        dbFilterFlightDep(departure)
        return
    }
    else if(departure=="" && destination !=""){
        dbFilterFlightDest(destination)
        return
    }
    else if(departure=="" && destination ==""){
        dbReadAllInfoFlight()
        return
    }



    var db = dbGetHandle()
    db.transaction(function(tx){
        var results = tx.executeSql(
                    'SELECT rowid,departure,destination,data,time,airplane,price FROM info_flight where departure = ? and destination = ?  order by rowid ',[departure, destination])
          listModel.clear()
          for (var i = 0; i < results.rows.length; i++) {
            listModel.append({
                                 rowidF: results.rows.item(i).rowid,
                                 departureF: results.rows.item(i).departure,
                                 destinationF: results.rows.item(i).destination,
                                 dateF: results.rows.item(i).data,
                                 timeF: results.rows.item(i).time,
                                 airplaneF: results.rows.item(i).airplane,
                                 priceF: results.rows.item(i).price,

                             })
        }
    })

}

function dbFilterFlightDep(departure){

    var db = dbGetHandle()
    db.transaction(function(tx){
        var results = tx.executeSql(
                    'SELECT rowid,departure,destination,data,time,airplane,price FROM info_flight where departure = ? order by rowid ',[departure])
          listModel.clear()
          for (var i = 0; i < results.rows.length; i++) {
            listModel.append({
                                 rowidF: results.rows.item(i).rowid,
                                 departureF: results.rows.item(i).departure,
                                 destinationF: results.rows.item(i).destination,
                                 dateF: results.rows.item(i).data,
                                 timeF: results.rows.item(i).time,
                                 airplaneF: results.rows.item(i).airplane,
                                 priceF: results.rows.item(i).price,

                             })
        }
    })

}

function dbFilterFlightDest(destination){

    var db = dbGetHandle()
    db.transaction(function(tx){
        var results = tx.executeSql(
                    'SELECT rowid,departure,destination,data,time,airplane,price FROM info_flight where destination = ? order by rowid ',[destination])
          listModel.clear()
          for (var i = 0; i < results.rows.length; i++) {
            listModel.append({
                                 rowidF: results.rows.item(i).rowid,
                                 departureF: results.rows.item(i).departure,
                                 destinationF: results.rows.item(i).destination,
                                 dateF: results.rows.item(i).data,
                                 timeF: results.rows.item(i).time,
                                 airplaneF: results.rows.item(i).airplane,
                                 priceF: results.rows.item(i).price,

                             })
        }
    })

}

function dbDeleteRequestDT(date, time)
{
    if(date !="" && time ==""){
        dbDeleteRequestDate(date)
        return
    }
    else if(date =="" && time !=""){
        dbDeleteRequestTime(time)
        return
    }
    else if (date =="" && time =="") return

    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('delete from info_request where data = ? and time = ?', [date, time])
         var results = tx.executeSql(
                    'SELECT * FROM info_request order by rowid ')
          listModelR.clear()
          for (var i = 0; i < results.rows.length; i++) {
            listModelR.append({
                                 rowidReq: results.rows.item(i).rowid,
                                 departureReq: results.rows.item(i).departure,
                                 destinationReq: results.rows.item(i).destination,
                                 dateReq: results.rows.item(i).data,
                                 timeReq: results.rows.item(i).time,
                                 surnameReq: results.rows.item(i).surname,
                                 nameReq: results.rows.item(i).name,

                             })
        }
    })
}

function dbDeleteRequestDate(date)
{

    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('delete from info_request where data = ?', [date])
         var results = tx.executeSql(
                    'SELECT * FROM info_request order by rowid ')
          listModelR.clear()
          for (var i = 0; i < results.rows.length; i++) {
            listModelR.append({
                                 rowidReq: results.rows.item(i).rowid,
                                 departureReq: results.rows.item(i).departure,
                                 destinationReq: results.rows.item(i).destination,
                                 dateReq: results.rows.item(i).data,
                                 timeReq: results.rows.item(i).time,
                                 surnameReq: results.rows.item(i).surname,
                                 nameReq: results.rows.item(i).name,

                             })
        }
    })
}


function dbDeleteRequestTime(time)
{

    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('delete from info_request where time = ?', [time])
         var results = tx.executeSql(
                    'SELECT * FROM info_request order by rowid ')
          listModelR.clear()
          for (var i = 0; i < results.rows.length; i++) {
            listModelR.append({
                                 rowidReq: results.rows.item(i).rowid,
                                 departureReq: results.rows.item(i).departure,
                                 destinationReq: results.rows.item(i).destination,
                                 dateReq: results.rows.item(i).data,
                                 timeReq: results.rows.item(i).time,
                                 surnameReq: results.rows.item(i).surname,
                                 nameReq: results.rows.item(i).name,

                             })
        }
    })
}
