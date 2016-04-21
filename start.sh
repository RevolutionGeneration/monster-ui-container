#!/bin/sh

if [ "$API_URL" != "" ] ; then
    sed -ri "s/http://your_API_URL//$API_URL/g" /usr/share/nginx/html/js/config.js;
fi


