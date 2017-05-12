#include "roleentrymodel.h"

RoleEntryModel::RoleEntryModel(QObject *parent)
    : QAbstractListModel(parent)
{
	// Define os nomes dos roles (QHash<int, QByteArray>)
	// model.name, model.hue, model.saturation, model.brightness
	m_rolesNames[NameRole] = "name";
	m_rolesNames[HueRole] = "hue";
    m_rolesNames[SaturationRole] = "saturation";
	m_rolesNames[BrightnessRole] = "brightness";

	// acrescentar os nomes das cores como QColor para a lista de dados (QList<QColor)
	for (const QString &name : QColor::colorNames()) {
		m_data.append(QColor(name))
	}
}

RoleEntryModel::~RoleEntryModel()
{
}

int
RoleEntryModel::data(const QModelIndex &index, int role) const
{
    int row = index.row();
    if (row < 0 || row >= m_data.count()) {
        return QVariant();
    }

    const QColor &color = m_data.at(row);
    qDebug() << row << role << color;

    switch (role) {
    case NameRole:
        return color.name();
    case HueRole:
        return color.hueF();
    case SaturationRole:
        return color.saturationF();
    case BrightnessRole:
        return color.lightnessF();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray>
RoleEntryModel::roleNames() const
{
    return m_roleNames;
}
