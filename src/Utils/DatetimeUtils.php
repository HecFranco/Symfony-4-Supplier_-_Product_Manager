<?php
/**
 * Created by PhpStorm.
 * User: usuario
 * Date: 29/07/2018
 * Time: 20:18
 */

namespace App\Utils;


class DatetimeUtils
{
    public function isValid(?string $datetime, $format = 'Y-m-d'): bool
    {
        $d = \DateTime::createFromFormat($format, $datetime);
        return $d && $d->format($format) === $datetime;
    }

    public function isToday(\DateTime $date)
    {
        $today = new \DateTime();
        return $today->diff($date)->days == 0;
    }

    /**
     * @param $timeText
     * @return bool
     */
    public function isPostMeridiam($timeText)
    {
        $meridian = substr($timeText, -2); // take 2 last chars
        return strpos($meridian, 'PM') !== false; // contains PM
    }

    /**
     * @param $date
     * @return false|string
     */
    public function getWeekday(\DateTime $date)
    {
        return $date->format('N');
    }

    /**
     * Get difference between two DateTimeInterface (only counting hours and minutes)
     *
     * @param \DateTimeInterface $dateTime1
     * @param \DateTimeInterface $dateTime2
     * @return float|int
     */
    public function diffInMinutes(\DateTimeInterface $dateTime1, \DateTimeInterface $dateTime2)
    {
        $diff = $dateTime1->diff($dateTime2);
        return $diff->h * 60 + $diff->i;
    }

    public function isAm(): \Closure
    {
        return function ($hour) {
            if ($hour instanceof \DateTime) {
                return $hour->format('a') === 'am';
            }
            return $hour >= 0 && $hour <= 12;
        };
    }

    public function isBetween(\DateTimeInterface $from, \DateTimeInterface $to, \DateTimeInterface $subject){
        return $subject->getTimestamp() >= $from->getTimestamp() && $subject->getTimestamp() < $to->getTimestamp();
    }

    public function ordinal($number) {
        $ends = array('th','st','nd','rd','th','th','th','th','th','th');
        return ((($number % 100) >= 11) && (($number%100) <= 13)) ? 'th' : $ends[$number % 10];
    }
}