<?php
define( 'PGCARD_SAMPLE_BASE', dirname(__FILE__));
define( 'PGCARD_SAMPLE_ENCODING' , 'UTF-8');

/* 以下の項目をお客様のインストール環境に合わせて設定してください */
// define( 'PGCARD_SAMPLE_URL' , 'http://localhost/clientSample');

// define( 'PGCARD_SECURE_RIDIRECT_HTML' , '/your/path/to/RidirectPage');

// define( 'PAYPAL_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'WEBMONEY_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'AU_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'AU_CONTINUANCE_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');

// define( 'DOCOMO_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'DOCOMO_CONTINUANCE_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'SB_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'JIBUN_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');

// define( 'FLETS_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'NETCASH_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'RAKUTEN_ID_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'MCP_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'LINEPAY_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'UNIONPAY_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'SB_CONTINUANCE_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');
// define( 'RECRUIT_START_RIDIRECT_HTML' , '/your/path/to/RidirectPage');


/* 以下の項目をテスト環境設定書に従って設定してください */
define( 'PGCARD_SHOP_ID' , '9100608224758');
define( 'PGCARD_SHOP_PASS' , '2935728m');
define( 'PGCARD_SITE_ID' , 'mst2000006379');
define( 'PGCARD_SITE_PASS' , 'b2ddxfsx');



// 取引登録 https://p01.mul-pay.jp/payment/EntryTran.idPass
// 決済実行 https://p01.mul-pay.jp/payment/ExecTran.idPass
// 3D認証決済実行 https://p01.mul-pay.jp/payment/SecureTran.idPass
// 決済変更 https://p01.mul-pay.jp/payment/AlterTran.idPass
// 金額変更 https://p01.mul-pay.jp/payment/ChangeTran.idPass
// 取引照会 https://p01.mul-pay.jp/payment/SearchTrade.idPass

// 決済後カード登録 https://p01.mul-pay.jp/payment/TradedCard.idPass
// 会員登録 https://p01.mul-pay.jp/payment/SaveMember.idPass
// 会員更新 https://p01.mul-pay.jp/payment/UpdateMember.idPass
// 会員照会 https://p01.mul-pay.jp/payment/SearchMember.idPass
// 会員削除 https://p01.mul-pay.jp/payment/DeleteMember.idPass
// カード登録／更新 https://p01.mul-pay.jp/payment/SaveCard.idPass
// カード照会 https://p01.mul-pay.jp/payment/SearchCard.idPass
// カード削除 https://p01.mul-pay.jp/payment/DeleteCard.idPass
