<?php

use Illuminate\Support\Str;

/*
 * 修改后需 运行 ： php artisan config:cache 命令
 *
 */
return [

    'APPID' => 'APPIDSTR',

    // http 状态码
    'HTTP_STATUS' => [
        // Informational 1xx
        'Continue' => 100,
        'Switching_Protocols' => 101,
        // Success 2xx
        'OK' => 200,
        'Created' => 201,
        'Accepted' => 202,
        'Non-Authoritative_Information' => 203,
        'No_Content' => 204,
        'Reset_Content' => 205,
        'Partial_Content' => 206,
        // Redirection 3xx
        'Multiple_Choices' => 300,
        'Moved_Permanently' => 301,
        'Moved_Temporarily ' => 302,  // 1.1
        'See_Other' => 303,
        'Not_Modified' => 304,
        'Use_Proxy' => 305,
        //  'is_deprecated_but_reserved' => 306 ,
        'Temporary_Redirect' => 307,
        // Client Error 4xx
        'Bad_Request' => 400,
        'Unauthorized' => 401,
        'Payment_Required' => 402,
        'Forbidden' => 403,
        'Not_Found' => 404,
        'Method_Not Allowed' => 405,
        'Not_Acceptable' => 406,
        'Proxy_Authentication Required' => 407,
        'Request_Timeout' => 408,
        'Conflict' => 409,
        'Gone' => 410,
        'Length_Required' => 411,
        'Precondition_Failed' => 412,
        'Request_Entity_Too_Large' => 413,
        'Request-URI_Too_Long' => 414,
        'Unsupported_Media_Type' => 415,
        'Requested_Range_Not_Satisfiable' => 416,
        'Expectation_Failed' => 417,
        // Server Error 5xx
        'Internal_Server_Error' => 500,
        'Not_Implemented' => 501,
        'Bad_Gateway' => 502,
        'Service_Unavailable' => 503,
        'Gateway_Timeout' => 504,
        'HTTP_Version_Not_Supported' => 505,
        'Bandwidth_Limit_Exceeded ' => 509
    ],
    'HTTP_STATUS_descript' => [
           // Informational 1xx
           100 => 'Continue',
           101 => 'Switching Protocols',
           // Success 2xx
           '200' => 'OK',
           201 => 'Created',
           '202' => 'Accepted',
           203 => 'Non-Authoritative Information',
           204 => 'No Content',
           205 => 'Reset Content',
           206 => 'Partial Content',
           // Redirection 3xx
           300 => 'Multiple Choices',
           301 => 'Moved Permanently',
           302 => 'Moved Temporarily ',  // 1.1
           303 => 'See Other',
           304 => 'Not Modified',
           305 => 'Use Proxy',
           // 306 is deprecated but reserved
           307 => 'Temporary Redirect',
           // Client Error 4xx
           400 => 'Bad Request',
           401 => 'Unauthorized',
           402 => 'Payment Required',
           403 => 'Forbidden',
           404 => 'Not Found',
           405 => 'Method Not Allowed',
           406 => 'Not Acceptable',
           407 => 'Proxy Authentication Required',
           408 => 'Request Timeout',
           409 => 'Conflict',
           410 => 'Gone',
           411 => 'Length Required',
           412 => 'Precondition Failed',
           413 => 'Request Entity Too Large',
           414 => 'Request-URI Too Long',
           415 => 'Unsupported Media Type',
           416 => 'Requested Range Not Satisfiable',
           417 => 'Expectation Failed',
           // Server Error 5xx
           500 => 'Internal Server Error',
           501 => 'Not Implemented',
           502 => 'Bad Gateway',
           503 => 'Service Unavailable',
           504 => 'Gateway Timeout',
           505 => 'HTTP Version Not Supported',
           509 => 'Bandwidth Limit Exceeded'
       ],


];
