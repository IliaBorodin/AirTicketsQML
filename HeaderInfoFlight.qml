import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage

    Grid {
        columns: 2
        spacing: 2
        anchors.fill: parent
      Row{
      width:window.width/2
        Text {
            width:window.width/4
            text: "Departure"
            font.pixelSize: 16

            horizontalAlignment: Text.AlignHCenter



        }
        TextField {
                width:window.width/4
                placeholderText: qsTr("")
                onTextEdited: console.log(acceptableInput)

            }
      }
      Row{
      width:window.width/2
             Text {
            width:window.width/4
            text: "Destination"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter


        }
        TextField {
                width:window.width/4
                placeholderText: qsTr("")
                onTextEdited: console.log(acceptableInput)

            }
      }
       Row{
      width:window.width/2
             Text {
            width:window.width/4
            text: "Data"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter


        }
        TextField {
                width:window.width/4
                placeholderText: qsTr("")
                validator: RegularExpressionValidator { regularExpression: /[0-9/,:.]+/ }
                onTextEdited: console.log(acceptableInput)

            }
      }
       Row{
      width:window.width/2
             Text {
            width:window.width/4
            text: "Time"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter


        }
        TextField {
                width:window.width/4
                placeholderText: qsTr("")
                validator: RegularExpressionValidator { regularExpression: /[0-9/,:.]+/ }
                onTextEdited: console.log(acceptableInput)

            }
      }
      Row{
      width:window.width/2
             Text {
            width:window.width/4
            text: "Airplane"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter


        }
        TextField {
                width:window.width/4
                placeholderText: qsTr("")
                onTextEdited: console.log(acceptableInput)

            }
      }
      Row{
      width:window.width/2
             Text {
            width:window.width/4
            text: "Price"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter


        }
        TextField {
                width:window.width/4
                placeholderText: qsTr("")
                validator: RegularExpressionValidator { regularExpression: /\d{1,3}/ }
                onTextEdited: console.log(acceptableInput)

            }
      }
    }

