import QtQuick 2.0

Item {
    ListView {
        id: listView
        anchors.fill: parent
        model: ElementListModel {}
        focus: true
        spacing: 1
        boundsBehavior: Flickable.StopAtBounds
        delegate: EListDelegate {
            width: parent.width
        }
    }
}
