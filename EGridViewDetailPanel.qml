import QtQuick 2.0
import QtQuick.Layouts 1.3

Rectangle {
    id: panel

    function calcX() {
        var _x = gridViewPanel.width;
        if(gridViewPanel.selectedElementNumber !== "")
            _x -= width;
        return _x;
    }

    anchors {
        top: parent.top
        bottom: parent.bottom
    }
    width: 250
    x: calcX()
    color: "#3c3c3c"

    Behavior on x {
        NumberAnimation { duration: 100 }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            height: 30
            color: "transparent"

            RowLayout {
                anchors.fill: parent
                spacing: 0

                Item {
                    id: closeButton
                    Layout.fillHeight: true
                    width: 30

                    Text {
                        anchors.centerIn: parent
                        text: "X"
                        color: "white"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: gridViewPanel.selectedElementNumber = ""
                    }
                }

                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"
        }
    }
}
