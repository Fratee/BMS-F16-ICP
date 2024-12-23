#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "tcpclient.h"
#include <QSettings>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Frate");
    app.setOrganizationDomain("bagigi.ovh");
    app.setApplicationName("F16_ICP");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    QSettings settings(app.organizationName(), app.applicationName());
    qDebug() << "Stored IP Address: " << settings.value("ipAddress", "127.0.0.1").toString();
    qDebug() << "Stored port: " << settings.value("port", 12345).toInt();
    engine.rootContext()->setContextProperty("settings", &settings);

    engine.loadFromModule("F16_ICP", "Main");

    // Create the TCP Client instance
    TcpClient client(&settings);
    engine.rootContext()->setContextProperty("client", &client);

    return app.exec();
}
