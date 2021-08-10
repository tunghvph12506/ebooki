<?php
return [
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=localhost;dbname=trangpv_ebook',
            'username' => 'trangpv_suusoft',
            'password' => 'trangpv_suusoft',
            'charset' => 'utf8',
        ],
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            // send all mails to a file by default. You have to set
            // 'useFileTransport' to false and configure a transport
            // for the mailer to send real emails.
            'useFileTransport' => false,
            'transport' => [
                'class' => 'Swift_SmtpTransport',
                'host' => 'smtp.gmail.com',
                'username' => 'fruity.tester@gmail.com',
                'password' => 'trollerlvlmax',
                'port' => '587',
                'encryption' => 'tls',
            ],
        ],
    ],
];
