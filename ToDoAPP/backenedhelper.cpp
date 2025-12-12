#include "backenedhelper.h"

BackenedHelper::BackenedHelper(QObject *parent) : QObject(parent)
{
    m_currentDay = QString::number(QDateTime::currentDateTime().date().day());
    QLocale locale;
    m_currentMonth = locale.monthName(QDateTime::currentDateTime().date().month());
    m_currentYear = QString::number(QDateTime::currentDateTime().date().year());
    m_currentDayOfWeek =  locale.dayName(QDateTime::currentDateTime().date().dayOfWeek());
}

QString BackenedHelper::currentDay() const
{
    return m_currentDay;
}

void BackenedHelper::setCurrentDay(const QString &newCurrentDay)
{
    if (m_currentDay == newCurrentDay)
        return;
    m_currentDay = newCurrentDay;
    emit currentDayChanged();
}

QString BackenedHelper::currentMonth() const
{
    return m_currentMonth;
}

void BackenedHelper::setCurrentMonth(const QString &newCurrentMonth)
{
    if (m_currentMonth == newCurrentMonth)
        return;
    m_currentMonth = newCurrentMonth;
    emit currentMonthChanged();
}

QString BackenedHelper::currentYear() const
{
    return m_currentYear;
}

void BackenedHelper::setCurrentYear(const QString &newCurrentYear)
{
    if (m_currentYear == newCurrentYear)
        return;
    m_currentYear = newCurrentYear;
    emit currentYearChanged();
}

QString BackenedHelper::currentDayOfWeek() const
{
    return m_currentDayOfWeek;
}

void BackenedHelper::setcurrentDayOfWeek(const QString &newCurrentDayOfWeek)
{
    if (m_currentDayOfWeek == newCurrentDayOfWeek)
        return;
    m_currentDayOfWeek = newCurrentDayOfWeek;
    emit setcurrentDayOfWeek();
}
