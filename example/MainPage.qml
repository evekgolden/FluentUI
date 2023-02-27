﻿import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import FluentUI 1.0

FluWindow {
    id:rootwindow
    width: 800
    height: 600
    title: "FluentUI"

    FluAppBar{
        id:appbar
        title: "FluentUI"
    }

    ListModel{
        id:nav_items
        ListElement{
            text:"Controls"
            page:"qrc:/T_Controls.qml"
        }
        ListElement{
            text:"Typography"
            page:"qrc:/T_Typography.qml"
        }
    }

    ListView{
        id:nav_list
        anchors{
            top: appbar.bottom
            bottom: parent.bottom
            topMargin: 20
            bottomMargin: 20
        }
        width: 160
        model: nav_items
        delegate: Item{
            height: 38
            width: nav_list.width

            Rectangle{
                color: {
                    if(FluApp.isDark){
                        if(item_mouse.containsMouse){
                            return "#292929"
                        }
                        if(nav_list.currentIndex === index){
                            return "#2D2D2D"
                        }
                        return "#00000000"
                    }else{
                        if(item_mouse.containsMouse){
                            return "#EDEDED"
                        }
                        if(nav_list.currentIndex === index){
                            return "#EAEAEA"
                        }
                        return "#00000000"
                    }
                }
                radius: 4
                anchors{
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                    topMargin: 2
                    bottomMargin: 2
                    leftMargin: 6
                    rightMargin: 6
                }
            }

            MouseArea{
                id:item_mouse
                hoverEnabled: true
                anchors.fill: parent
                onClicked: {
                    nav_list.currentIndex = index
                }
            }

            FluText{
                text:model.text
                anchors.centerIn: parent
                fontStyle: FluText.Caption
            }

        }
    }

    Rectangle{
        color: FluApp.isDark ? "#323232" : "#FFFFFF"
        radius: 10
        clip: true
        anchors{
            left: nav_list.right
            leftMargin: 2
            top: appbar.bottom
            topMargin: 20
            right: parent.right
            rightMargin: 10
            bottom: parent.bottom
            bottomMargin: 20
        }
        border.width: 1
        border.color: FluApp.isDark ? "#666666" : "#EEEEEE"

        Loader{
            anchors.fill: parent
            anchors.margins:20
            source: nav_items.get(nav_list.currentIndex).page
        }

    }

}