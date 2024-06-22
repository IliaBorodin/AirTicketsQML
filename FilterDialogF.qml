import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage
import "Database.js" as JS
Dialog {

    title: "Dialog"
    standardButtons: Dialog.Ok | Dialog.Cancel
    ColumnLayout{
    spacing:5
    TextField {
        id: departureFieldF
        width: parent.width
        placeholderText: qsTr("Пункт отправления")


    }

     TextField {
        id: destinationFieldF
        width: parent.width
        placeholderText: qsTr("Пункт назначения")


    }
}
    onAccepted:{
        JS.dbFilterFlight(departureFieldF.text, destinationFieldF.text)
    }
}
