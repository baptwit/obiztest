<?php

function determiner_age($datenaissance){
	$date = explode("/", $datenaissance);
	$datenaissance = $date[1]."/".$date[0]."/".$date[2];
	$now = new DateTime();
	$date = new DateTime($datenaissance);
	$diff = $now->diff($date);

	return $diff->format('%y');
}

function determiner_age_bdd($datenaissance){
	$age = determiner_age($datenaissance);
	if ($age <= 50){
		$agebdd = 1;
	}
	else {
		$agebdd = 2;
	}

	return $agebdd;
}

function convertir_date($datenaissance){
	$date = explode("/", $datenaissance);
	$datenaissance = $date[2]."-".$date[1]."-".$date[0];
	return $datenaissance;
}
function determiner_sexe_bdd($genre){
	if ($genre == 'femme') {
		$sexe_bdd = 0;
	}
	else {
		$sexe_bdd = 1;
	}

	return $sexe_bdd;
}

?>