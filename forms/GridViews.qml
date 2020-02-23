import QtQuick 2.0
import QtGraphicalEffects 1.0
import "../items/homepage"

Item {
    property alias grid_height: gridrec.height
    property alias grid_width: gridrec.width
    Rectangle {
        id:gridrec
//        width: 300
//        height: 200

        Component {
            id: bookDelegate
            Item {
                id: wrapper
                width: grid.cellWidth
                height: grid.cellHeight
                //鼠标点击选中
                MouseArea {
                    anchors.fill: parent
                    onClicked: wrapper.GridView.view.currentIndex = index
                }


                Image {
                    id:sourceimage
                    source: portrait
                    //设置图片大小
                    sourceSize: Qt.size(parent.width-20, parent.height-20)
//                    height: 80
//                    width: 80
                    smooth: true
                    visible: false
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Rectangle {
                    id: mask
                    width: parent.width
                    height: parent.height
                    radius: height/2
                    color:"red"
                    visible: false
                }

                OpacityMask {
                    anchors.fill: sourceimage
                    source: sourceimage
                    maskSource: mask
                }

                Text {
                    text: name
                    anchors.top: sourceimage.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: wrapper.GridView.isCurrentItem ? "grey" : "black"
                }
             }
         }

         GridView {
             id: grid
             clip: true
             anchors.fill: parent
             cellWidth: 1/3*gridrec.width
             cellHeight: 0.5*gridrec.height

             model: GridBook {}
             delegate: bookDelegate
             highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
             focus: true
         }
     }
}
