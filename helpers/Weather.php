<?php

class Weather
{
    private $configuration;

    public function __construct()
    {
        $cache_file = 'data.json';
        if (file_exists($cache_file)) {
            $dat = json_decode(file_get_contents($cache_file));
        } else {
            $api_url = 'https://content.api.nytimes.com/svc/weather/v2/current-and-seven-day-forecast.json';
            $dat = file_get_contents($api_url);
            file_put_contents($cache_file, $dat);
            $dat = json_decode($dat);
        }
        $this->configuration = $dat;
    }

    public function getDayWeather()
    {
        return $this->configuration->results->current[0];
    }

    public function getWeekWeather()
    {

        return $this->configuration->results->seven_day_forecast;
    }

    public function getCelciusTempDay()
    {

        $celciusTemp = number_format((float)(($this->configuration->results->current[0]->temp - 32) / 1.75), 1, '.', '');
        return $celciusTemp;
    }
}