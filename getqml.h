#ifndef GETQML_H
#define GETQML_H

#include <QObject>


class getQml : public QObject
{
    Q_OBJECT
public:
    explicit getQml(QObject *parent = nullptr);
    QString kematian;
    Q_INVOKABLE QString setdata1(QString r);
    QString Provinsi = "Jawa Barat" ;
    QString Positif;

    QString sembuh;


    Q_INVOKABLE QString getKematian(){
        return kematian;
    };

    Q_INVOKABLE QString getKesembuhan(){
        return sembuh;
    };
    Q_INVOKABLE QString getPositif(){
        return Positif;
    };



signals:


private:
  QString myTest;


};

#endif // GETQML_H
