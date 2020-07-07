import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.13


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    function request(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(myxhr) {
            return function() {
                if(myxhr.readyState === 4) { callback(myxhr); }
            }
        })(xhr);

        xhr.open("GET", url);
        xhr.send();
    }
//    Button {
//        id: button
//        x: 88
//        y: 260
//        text: qsTr("Button")

//        onClicked:
//        {
//            request("https://services5.arcgis.com/VS6HdKS0VfIhv8Ct/arcgis/rest/services/COVID19_Indonesia_per_Provinsi/FeatureServer/0/query?where=Provinsi%20%3D%20'JAWA%20BARAT'&outFields=*&outSR=4326&f=json", function (o)
//            {
//                if (o.status === 200)
//                {
//                    //console.log(o.responseText);
//                    var a = JSON.parse(o.responseText);
//                    console.log(value.getKematian())
//                    value.setdata1(o.responseText)
//                }
//                else
//                {
//                    console.log("Some error has occurred");
//                }
//            });
//        }

//    }

    Text {
        id: element
        x: 28
        y: 31
        text: qsTr("DATA COVID JABAR")
        font.bold: true
        font.pixelSize: 25
    }

    Text {
        id: element1
        x: 28
        y: 88
        text: qsTr("Kasus Positif :")
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id: element2
        x: 28
        y: 124
        text: qsTr("Kasus Sembuh :")
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id: element3
        x: 28
        y: 166
        text: qsTr("Kasus Kematian :")
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id: textPositif
        x: 173
        y: 88
        width: 37
        height: 25
        text: ""
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id: textSembuh
        x: 189
        y: 124
        color: "#51d50c"
        text: ""
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id: textKematian
        x: 205
        y: 166
        color: "#a70202"
        text: ""
        font.bold: true
        font.pixelSize: 18
        onTextChanged: value.getKematian()
    }


    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textKematian.text = value.getKematian()

    }
    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textSembuh.text = value.getKesembuhan()
    }
    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: textPositif.text = value.getPositif()
    }

    Timer { interval: 1000; running: true; repeat: true;
            onTriggered: request("https://services5.arcgis.com/VS6HdKS0VfIhv8Ct/arcgis/rest/services/COVID19_Indonesia_per_Provinsi/FeatureServer/0/query?where=Provinsi%20%3D%20'JAWA%20BARAT'&outFields=*&outSR=4326&f=json", function (o)
            {
                if (o.status === 200)
                {
                    //console.log(o.responseText);
                    var a = JSON.parse(o.responseText);
                   // console.log(value.getKematian())
                    value.setdata1(o.responseText)
                }
                else
                {
                    console.log("Some error has occurred");
                }
            });
    }

}











