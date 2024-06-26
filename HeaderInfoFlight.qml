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
                id:departureInput
                width:window.width/4
                placeholderText: qsTr("")


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
                id:destinationInput
                width:window.width/4
                placeholderText: qsTr("")


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
                id:dateInput
                width:window.width/4
                placeholderText: qsTr("")
                validator: RegularExpressionValidator { regularExpression: /^(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)$/}


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
                id:timeInput
                width:window.width/4
                placeholderText: qsTr("")
                validator: RegularExpressionValidator { regularExpression: /^([1\s]?[0-9\s]|2[0-3\s]):([0-5\s][0-9\s]):([0-5\s][0-9\s])$/ }


            }
      }
      Row{
      width:window.width/2
             Text {
            width:window.width/4
            text: "Самолёт"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter


        }
        TextField {
                id:airplaneInput
                width:window.width/4
                placeholderText: qsTr("")


            }
      }
      Row{
      width:window.width/2
             Text {
            width:window.width/4
            text: "Цена"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter


        }
        TextField {
                id:priceInput
                width:window.width/4
                placeholderText: qsTr("")
                validator: RegularExpressionValidator { regularExpression: /\d{1,4}/ }


        }
      }




    function clearElem() {
        departureInput.clear()
        destinationInput.clear()
        dateInput.clear()
        timeInput.clear()
        airplaneInput.clear()
        priceInput.clear()
    }


    function addNewElem(){
        var rowid = parseInt(JS.dbInsertInfoFlight(departureInput.text, destinationInput.text, dateInput.text,timeInput.text,airplaneInput.text,Number(priceInput.text)), 10)
        listView.model.append({rowidF: rowid,
                               departureF: departureInput.text,
                               destinationF: destinationInput.text,
                               dateF: dateInput.text,
                               timeF: timeInput.text,
                               airplaneF:airplaneInput.text,
                               priceF:Number(priceInput.text)})
    }

    function deleteCurElem(){
        JS.dbDeleteInfoFlightRow(listView.model.get(listView.currentIndex).rowidF)
        listView.model.remove(listView.currentIndex, 1)
         if (listView.count == 0) {
             listView.currentIndex = -1
         }
    }


}


