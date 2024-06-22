import QtQuick 2.0

Grid{
    id:gridR
    property alias idNameR: idFlightR.text
    property alias fromToNameR: idFromToR.text
    property alias dateTimeNameR: idDateTimeR.text
    property alias nameSurnameR: idNameSurnameR.text
    property string _colorR: "#ffe4c4"
    columns: 3
    spacing: 2
    height: 120
    width: parent.width
    Rectangle{
        id:firstRecR
        color: _colorR
        border { color: "black"; width: 1 }
        width:gridR.width/10
        height:gridR.height

    Text{
            id:idFlightR
         //   text:"ID"
            anchors.centerIn: parent
        }
    }
     Rectangle{
        id:secondRecR
        color: _colorR
        border { color: "black"; width: 1 }
        width:gridR.width * 0.4
        anchors.left:firstRecR.right
        height:gridR.height

    Text{
        id:idFromToR
          //  text:"FromTo"
            anchors.centerIn: parent
    }
    }
    Column{
        id:columnR
        height:gridR.height
        width:gridR.width
        anchors.left:secondRecR.right

        Rectangle{
            id: thirdRecR
            color: _colorR
            height:gridR.height/2
            width:gridR.width * 0.5
            border { color: "black"; width: 1 }
            Text{
                id:idDateTimeR
              //   text:"DateTime"
                anchors.centerIn: parent
            }

        }
          Rectangle{
            id: fourRecR
            color: _colorR
            height:gridR.height/2
            width:gridR.width * 0.5
            border { color: "black"; width: 1 }
            Text{
                id:idNameSurnameR
              //   text:"DateTime"
                anchors.centerIn: parent
            }

        }

    }

}