#ifndef TCPSERVER_H
#define TCPSERVER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>

class TcpServer : public QObject {
    Q_OBJECT

public:
    explicit TcpServer(QObject *parent = nullptr);
    bool startServer(quint16 port);

private slots:
    void onNewConnection();
    void onReadyRead();
    void onClientDisconnected();
    void onErrorOccurred(QAbstractSocket::SocketError socketError);

private:
    QTcpServer *server;
    QList<QTcpSocket *> clients;
};

#endif // TCPSERVER_H
