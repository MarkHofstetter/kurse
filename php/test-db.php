<?php

$db = oci_connect('hr', 'hr', 'orcl');

$q = oci_parse($db, "select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') from dual");

$r = oci_execute($q, OCI_DEFAULT);

$row = oci_fetch_array($q, OCI_RETURN_NULLS);

echo "Zeit aus der Oracle DB: " .$row[0] . "\n";

?>
