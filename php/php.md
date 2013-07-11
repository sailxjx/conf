蛇形驼峰互转

$s = "hello_world_ruby";
$s2 = preg_replace_callback('/(?:^|_)([a-z])/', function($matches) {
    return strtoupper($matches[1]);
}, $s);
print_r($s2);
->  HelloWorldRuby

$className = "HelloWorldRuby";
$snakeTableName = preg_replace('/(?<!\b)(?=[A-Z])/', "_", $className);
print_r($snakeTableName);
-> Hello_World_Ruby
