import QtQuick 2.0

Grid{
    id:grid
    property alias idName: idFlight.text
    property alias fromToName: idFromTo.text
    property alias dateTimeName: idDateTime.text
    property alias airplaneName: idAirplane.text
    property alias price: idPrice.text
    property string _color: "#ffe4c4"
    columns: 3
    spacing: 2
    height: 120
    width: parent.width
    Rectangle{
        id:firstRec
        color: _color
        border { color: "black"; width: 1 }
        width:grid.width/10
        height:grid.height

    Text{
            id:idFlight
         //   text:"ID"
            anchors.centerIn: parent
        }
    }
     Rectangle{
        id:secondRec
        color: _color
        border { color: "black"; width: 1 }
        width:grid.width * 0.4
        anchors.left:firstRec.right
        height:grid.height

    Text{
        id:idFromTo
          //  text:"FromTo"
            anchors.centerIn: parent
    }
    }
    Column{
        id:column
        height:grid.height
        width:grid.width
        anchors.left:secondRec.right

        Rectangle{
            id: thirdRec
            color: _color
            height:grid.height/2
            width:grid.width * 0.5
            border { color: "black"; width: 1 }
            Text{
                id:idDateTime
              //   text:"DateTime"
                anchors.centerIn: parent
            }

        }
        Row{
            width:grid.width
            height:grid.height/2
            anchors.left:secondRec.right
            anchors.top:thirdRec.bottom

            Rectangle{
                id:fourRec
                color:_color
                width:grid.width/4
                height:parent.height
                border { color: "black"; width: 1 }
                Text{
                id:idAirplane
                // text:"Airplane"
                anchors.centerIn: parent
            }
            }

             Rectangle{
                id:fiveRec
                color:_color
                width:grid.width/4
                height:parent.height
                border { color: "black"; width: 1 }
                Text{
                id:idPrice
                // text:"Price"
                anchors.centerIn: parent
            }
            }
        }
    }

}