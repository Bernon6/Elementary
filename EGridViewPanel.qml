import QtQuick 2.0
import QtQuick.Layouts 1.3

Item {
    property string selectedElementNumber: ""
    signal selectedItemChanged(string elementNumber)
    onSelectedItemChanged: {
        selectedElementNumber = elementNumber;
    }

    EGridModel {
        id: elementGridModel
    }

    Item {
        anchors.fill: parent
        anchors.margins: 5

        ColumnLayout {
            id: gridViewLayout
            anchors.fill: parent
            spacing: 5

            GridView {
                id: gridView
                property string selectedElementNumber: ""
                onSelectedElementNumberChanged: {
                    gridViewPanel.selectedElementNumber = elementNumber;
                }

                Layout.fillHeight: true
                Layout.fillWidth: true
                cellWidth: width / 18
                cellHeight: cellWidth
                model: elementGridModel
                boundsBehavior: Flickable.StopAtBounds
                delegate: EGridDelegate {
                    Component.onCompleted: {
                        clicked.connect(gridViewPanel.selectedItemChanged)
                    }
                }
            }
        }
    }

    EGridViewDetailPanel {
        id: detailPanel

        function calcX() {
            var _x = gridViewPanel.width;
            if(gridViewPanel.selectedElementNumber !== "")
                _x -= width;
            return _x;
        }
        x: calcX()

        anchors {
            top: parent.top
            bottom: parent.bottom
        }
    }
}
