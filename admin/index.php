<?php
// Version
define('VERSION', '1.5.3.1');

// Configuration
require_once('config.php');

// Install 
if (!defined('DIR_APPLICATION')) {
	header('Location: ../install/index.php');
	exit;
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');

// Application Classes
require_once(DIR_SYSTEM . 'library/currency.php');
require_once(DIR_SYSTEM . 'library/user.php');
require_once(DIR_SYSTEM . 'library/weight.php');
require_once(DIR_SYSTEM . 'library/length.php');

// Registry
$registry = new Registry();

// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);

// Config
$config = new Config();
$registry->set('config', $config);

// Database
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$registry->set('db', $db);

// test Session
//$session = new Session();
//$registry->set('session', $session); 

// test User
//$registry->set('user', new User($registry));
//$store_id = $registry->get('user')->getStoreId();
//echo "my store is ".$store_id;

// test User
//$registry->set('user', new User($registry));

// test Front Controller
//$controller = new Front($registry);

// test Login
//$controller->addPreAction(new Action('common/home/login'));
//$store_id = $registry->get('user')->getStoreId();
//echo "my store is ".$store_id;

// Settings
$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '0'");
//$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting");

//$settingArray = array();
 
foreach ($query->rows as $setting) {
	if (!$setting['serialized']) {
		$config->set($setting['key'], $setting['value'], $setting['store_id']);
	} else {
		$config->set($setting['key'], unserialize($setting['value']), $setting['store_id']);
	}	
}

//$config->getStoreData(1, $setting1);
//var_dump($setting1);

// Url
$url = new Url(HTTP_SERVER, $config->get('config_use_ssl') ? HTTPS_SERVER : HTTP_SERVER);	
$registry->set('url', $url);
		
// Log 
$log = new Log($config->get('config_error_filename'));
$registry->set('log', $log);

function error_handler($errno, $errstr, $errfile, $errline) {
	global $log, $config;
	
	switch ($errno) {
		case E_NOTICE:
		case E_USER_NOTICE:
			$error = 'Notice';
			break;
		case E_WARNING:
		case E_USER_WARNING:
			$error = 'Warning';
			break;
		case E_ERROR:
		case E_USER_ERROR:
			$error = 'Fatal Error';
			break;
		default:
			$error = 'Unknown';
			break;
	}
		
	if ($config->get('config_error_display')) {
		echo '<b>' . $error . '</b>: ' . $errstr . ' in <b>' . $errfile . '</b> on line <b>' . $errline . '</b>';
	}
	
	if ($config->get('config_error_log')) {
		$log->write('PHP ' . $error . ':  ' . $errstr . ' in ' . $errfile . ' on line ' . $errline);
	}

	return true;
}

// Error Handler
set_error_handler('error_handler');
		
// Request
$request = new Request();
$registry->set('request', $request);

// Response
$response = new Response();
$response->addHeader('Content-Type: text/html; charset=utf-8');
$registry->set('response', $response); 

// Cache
$cache = new Cache();
$registry->set('cache', $cache); 

// Session
$session = new Session();
$registry->set('session', $session); 

//test
//$tUser = 111111;
//$tUser = $registry->get('session')->data['user_id'];
//echo "the user_id is".$tUser;

// Language
$languages = array();

$query = $db->query("SELECT * FROM " . DB_PREFIX . "language"); 

foreach ($query->rows as $result) {
	$languages[$result['code']] = $result;
}

$config->set('config_language_id', $languages[$config->get('config_admin_language')]['language_id']);

// Language	
$language = new Language($languages[$config->get('config_admin_language')]['directory']);
$language->load($languages[$config->get('config_admin_language')]['filename']);	
$registry->set('language', $language); 		

// Document
$registry->set('document', new Document()); 		
		
// Currency
$registry->set('currency', new Currency($registry));		
		
// Weight
$registry->set('weight', new Weight($registry));

// Length
$registry->set('length', new Length($registry));

// User
$registry->set('user', new User($registry));
						
// Front Controller
$controller = new Front($registry);

// Login
$controller->addPreAction(new Action('common/home/login'));

// Permission
$controller->addPreAction(new Action('common/home/permission'));

// Router
if (isset($request->get['route'])) {
	$action = new Action($request->get['route']);
} else {
	$action = new Action('common/home');
}

// Store Settings according to the store_id
if ($registry->get('user')->isLogged())
{
	$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id =" . $registry->get('user')->getStoreId());
	foreach ($query->rows as $setting) {
		if (!$setting['serialized']) {
			$config->set($setting['key'], $setting['value'], $setting['store_id']);
		} else {
		//echo "key is ".$setting['key'].' and val is '.$setting['value'].' and store_id is '.$setting['store_id'];
			$config->set($setting['key'], unserialize($setting['value']), $setting['store_id']);
		}	
	}
}

//echo "ivy..." . $registry->get('user')->getStoreId();


// Dispatch
$controller->dispatch($action, new Action('error/not_found'));

// Output
$response->output();
?>