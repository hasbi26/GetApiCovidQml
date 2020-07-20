#ifndef SQL_H
#define SQL_H

#include <QObject>
#include <QSqlDatabase>
#include <QDebug>
#include <QTimer>
#include <QSqlQuery>
#include <QSqlError>
#include <QtSql>
#include "getqml.h"

class sql : public QObject
{
    Q_OBJECT
public:
    explicit sql(QObject *parent = nullptr);

    getQml *getqml;



signals:


private:


private slots:
    void notifSlot(QString);


};

#endif // SQL_H
