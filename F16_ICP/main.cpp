#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "tcpclient.h"
#include <QSettings>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Create a QSettings object to store persistent settings
    QSettings settings("Frate", "F16_ICP");

    // Retrieve the stored IP address (or use a default if not set)
    QString storedIpAddress = settings.value("ipAddress", "192.168.1.28").toString();

    // Log the retrieved IP address (for debugging purposes)
    qDebug() << "Stored IP Address: " << storedIpAddress;

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.rootContext()->setContextProperty("settings", &settings);
    engine.rootContext()->setContextProperty("storedIpAddress", storedIpAddress);

    engine.loadFromModule("F16_ICP", "Main");

    // Create the TCP Client instance
    TcpClient client;
    client.connectToServer(storedIpAddress, 12345);

    engine.rootContext()->setContextProperty("client", &client);

    return app.exec();
}
