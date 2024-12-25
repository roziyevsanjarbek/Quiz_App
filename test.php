<?php
$s = "Hello World";

$words = explode(" ", $s);
foreach ($words as $word) {
    if ($word == "World") {
        $len = strlen($word);
        echo "Soz uzunligi: " . $len;
    }
}

