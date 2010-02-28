<?php
$db = oci_connect('hr', 'hr', 'orcl');

$q = oci_parse($db, "select * from employees");

$r = oci_execute($q, OCI_DEFAULT);

print "Return $r\n";

$ncols = oci_num_fields($q);

print "<table border=1>\n";
echo "<tr>";
for ($i = 1; $i <= $ncols; $i++) {
    $column_name  = oci_field_name($q, $i);    
    echo "<td>$column_name</td>";
}
echo "</tr>";

while ($row = oci_fetch_array($q, OCI_ASSOC+OCI_RETURN_NULLS)) {
  print "<tr>\n";
  foreach ($row as $zellen) {
    if (!isset($zellen)) { $zellen = "_"; }
    print "<td> $zellen </td> ";
  }
  print "</tr>\n";
}
print "</table>\n";

