#include <QCoreApplication>
#include <QDebug>
#include "tcpserver.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    // Create and start the server
    TcpServer server;
    if (!server.startServer(12744)) {
        qDebug() << "Failed to start the server!";
        return -1;
    }

    return a.exec();
}
