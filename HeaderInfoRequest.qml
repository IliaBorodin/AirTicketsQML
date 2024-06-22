import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage
import "Database.js" as JS


  Grid {
        columns: 2
        spacing: 2
        anchors.fill: parent
      Row{
      width:window.width/2
        Text {
            width:window.width/4
            text: "Пункт отправления"
            font.pixelSize: 16

            horizontalAlignment: Text.AlignHCenter



        }
        TextField {
                id:departureInputReq
                width:window.width/4
                placeholderText: qsTr("")
            //    onTextEdited: console.log(acceptableInput)

            }
      }
      Row{
      width:window.width/2
             Text {
            width:window.width/4
            text: "Пункт назначения"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter


        }
        TextField {
                id:destinationInputReq
                width:window.width/4
                placeholderText: qsTr("")
              //  onTextEdited: console.log(acceptableInput)

            }
      }
       Row{
      width:window.width/2
             Text {
            width:window.width/4
            text: "Дата"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter


        }
        TextField {
                id:dateInputReq
                width:window.width/4
                placeholderText: qsTr("")
                validator: RegularExpressionValidator { regularExpression: /^(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)$/}
              //  onTextEdited: console.log(acceptableInput)

            }
      }
       Row{
      width:window.width/2
             Text {
            width:window.width/4
            text: "Время"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter


        }
        TextField {
                id:timeInputReq
                width:window.width/4
                placeholderText: qsTr("")
                validator: RegularExpressionValidator { regularExpression: /^([1\s]?[0-9\s]|2[0-3\s]):([0-5\s][0-9\s]):([0-5\s][0-9\s])$/ }
              //  onTextEdited: console.log(acceptableInput)

            }
      }
      Row{
      width:window.width/2
             Text {
            width:window.width/4
            text: "Имя"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter


        }
        TextField {
                id:nameInputReq
                width:window.width/4
                placeholderText: qsTr("")
               // onTextEdited: console.log(acceptableInput)

            }
      }
      Row{
      width:window.width/2
             Text {
            width:window.width/4
            text: "Фамилия"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter


        }
        TextField {
                id:surnameInputReq
                width:window.width/4
                placeholderText: qsTr("")
               // onTextEdited: console.log(acceptableInput))

            }
      }

       function clearElem() {
        departureInputReq.clear()
        destinationInputReq.clear()
        dateInputReq.clear()
        timeInputReq.clear()
        surnameInputReq.clear()
        nameInputReq.clear()
    }

    function addNewElemR(){
        var rowid = parseInt(JS.dbInsertInfoRequest(departureInputReq.text, destinationInputReq.text, dateInputReq.text,timeInputReq.text,surnameInputReq.text,nameInputReq.text), 10)
        listViewR.model.append({rowidReq: rowid,
                               departureReq: departureInputReq.text,
                               destinationReq: destinationInputReq.text,
                               dateReq: dateInputReq.text,
                               timeReq: timeInputReq.text,
                               surnameReq:surnameInputReq.text,
                               nameReq:nameInputReq.text})
    }

    function deleteCurElemR(){
        JS.dbDeleteInfoRequestRow(listViewR.model.get(listViewR.currentIndex).rowidReq)
        listViewR.model.remove(listViewR.currentIndex, 1)
         if (listViewR.count == 0) {
             listViewR.currentIndex = -1
         }
    }


}