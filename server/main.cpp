#include <QCoreApplication>
#include <QDebug>
#include "tcpserver.h"
#include <QSettings>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    // Create a QSettings object to read from the config file
    QSettings settings("config.ini", QSettings::IniFormat);

    // Read the port from the config file (default to 12744 if not found)
    int port = settings.value("Network/port", 12744).toInt();

    // Create and start the server
    TcpServer server;
    if (!server.startServer(port)) {
        qDebug() << "Failed to start the server!";
        return -1;
    }

    return a.exec();
}
