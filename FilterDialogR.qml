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
        id: timeFieldR
        width: parent.width
        placeholderText: qsTr("Введите время")
        validator: RegularExpressionValidator { regularExpression: /^([1\s]?[0-9\s]|2[0-3\s]):([0-5\s][0-9\s]):([0-5\s][0-9\s])$/ }

    }

     TextField {
        id: dateFieldR
        width: parent.width
        placeholderText: qsTr("Введите дату")
        validator: RegularExpressionValidator { regularExpression: /^(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)$/}

    }
}
    onAccepted:{
        JS.dbFilterDateTime(dateFieldR.text, timeFieldR.text)
    }
}
