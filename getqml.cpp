#include "getqml.h"
#include <QDebug>
#include <QByteArray>
#include <QFile>
#include <QJsonObject>
#include <QJsonDocument>
#include <QRegularExpression>


getQml::getQml(QObject *parent) : QObject(parent)
{
    qDebug()<<"before"<<myTest;


}


QString getQml::setdata1(QString r)
{
    myTest = r;
    //qDebug()<<"hasil get "<<myTest;
    QStringList list;
    list << myTest.split("Jawa Barat");
    QString value = list.last().split("geometry").at(0);
    kematian = list.last().split("geometry").at(0).split(",").at(3).split(":").at(1).split("}").at(0);
    Positif = list.last().split("geometry").at(0).split(",").at(1).split(":").at(1);
    sembuh = list.last().split("geometry").at(0).split(",").at(2).split(":").at(1);

    qDebug ()<<"Data Positif = "<< Positif;
    qDebug ()<<"Data Sembuh = "<< sembuh;
    qDebug ()<<"Data Kematian = "<< kematian;


    return 0;
}



