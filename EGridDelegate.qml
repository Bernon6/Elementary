import QtQuick 2.0

Rectangle {
    id: container

    property bool hovered: false

    signal clicked(string elementNumber)

    function getBgColor() {
        if(eSymbol === "")
            return "transparent";
        return hovered ? "white" : "lightgreen";
    }

    width: GridView.view.cellWidth - 2
    height: GridView.view.cellHeight - 2
    color: getBgColor()

    Text {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 3
        text: eNumber
        font.pointSize: 10
    }

    Text {
        anchors.centerIn: parent
        text: eSymbol
        font.pointSize: 18
    }

    Text {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 3
        text: {
            if(eWeight === "")
                return "";
            var f = parseFloat(eWeight);
            if(isNaN(f))
                return "";
            return f.toFixed(2).toString();
        }
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 10
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onHoveredChanged: parent.hovered = !parent.hovered
        onClicked: container.clicked(eNumber)
    }

}
