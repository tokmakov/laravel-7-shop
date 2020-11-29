<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;

class Item extends Model {

    // https://stackoverflow.com/questions/25023790/set-default-database-dateformat-to-iso-8601-with-timezones-in-laravel
    //protected $dateFormat = 'Y-m-d H:i:s';

    protected $fillable = ['name', 'timezone', 'slug', 'content', 'options'];

    protected $casts = [
        'options' => 'array',
    ];

    public function getCreatedAtAttribute($value) {
        /*
         * Если формат даты d.m.Y H:i:s, значит вызван метод модели
         * toArray() или toJson() — и мы возвращаем дату-время в UTC
         */
        if (preg_match('~^\d{2}\.\d{2}\.\d{4} \d{2}:\d{2}:\d{2}$~', $value)) {
            return Carbon::createFromFormat('d.m.Y H:i:s', $value)
                ->format('d.m.Y H:i:sP');
        }
        /*
         * Если формат даты Y-m-d H:i:s — преобразуем дату-время из
         * UTC в часовой пояс этого пользователя
         */
        return Carbon::createFromFormat('Y-m-d H:i:s', $value)
            ->timezone($this->timezone)
            ->format('d.m.Y H:i');
    }

    public function getUpdatedAtAttribute($value) {
        /*
         * Если формат даты d.m.Y H:i:s, значит вызван метод модели
         * toArray() или toJson() — возвращаем дату-время в UTC
         */
        if (preg_match('~^\d{2}\.\d{2}\.\d{4} \d{2}:\d{2}:\d{2}$~', $value)) {
            return Carbon::createFromFormat('d.m.Y H:i:s', $value)
                ->format('d.m.Y H:i:sP');
        }
        /*
         * Если формат даты Y-m-d H:i:s — преобразуем дату-время из
         * UTC в часовой пояс этого пользователя
         */
        return Carbon::createFromFormat('Y-m-d H:i:s', $value)
            ->timezone($this->timezone)
            ->format('d.m.Y H:i');
    }

    public static function timezones() {
        return [
            'Europe/Kaliningrad' => 'Калининград, Россия (+02:00)',
            'Europe/Moscow' => 'Москва, Россия (+03:00)',
            'Europe/Astrakhan' => 'Астрахань, Россия (+04:00)',
            'Asia/Yekaterinburg' => 'Екатеринбург, Россия (+05:00)',
            'Asia/Omsk' => 'Омск, Россия (+06:00)',
            'Asia/Novosibirsk' => 'Новосибирск, Россия (+07:00)',
            'Asia/Irkutsk' => 'Иркутск, Россия (+08:00)',
            'Asia/Chita' => 'Чита, Россия (+09:00)',
            'Asia/Vladivostok' => 'Владивосток, Россия (+10:00)',
            'Asia/Magadan' => 'Магадан, Россия (+11:00)',
            'Asia/Kamchatka' => 'Петропавловск-Камчатский, Россия (+12:00)'
        ];
    }

    protected function serializeDate(\DateTimeInterface $date) {
        return $date->format('d.m.Y H:i:s');
    }
}
