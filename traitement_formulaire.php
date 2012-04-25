<?php include_once 'fonctions.php' ?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>traitement du formulaire</title>
    </head>

    <body>

    	<p>Merci pour votre inscription, nous vous avons envoyé un e-mail pour votre inscription avec des bons plans proches de chez vous.<p>
		<p>pour revenir au formulaire <a href="index.html">cliquez ici</a></p>



		<?php 

		try
		{

		    $bdd = new PDO('mysql:host=localhost;dbname=baptiste_obiztest',
		    				'baptiste_obiz',
		    				'obiztest',
		    				array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
								  PDO::ATTR_ERRMODE => PDO::ERRMODE_WARNING));

		    $age = determiner_age_bdd($_POST['datenaissance']);
		    $ville = $_POST['ville'];
		    $sexe = determiner_sexe_bdd($_POST['genre']);

		    $date_bdd = convertir_date($_POST['datenaissance']);

		    $req = $bdd->prepare('INSERT INTO personnes(NOM, PRENOM, DATENAISSANCE, VILLE, SEXE, EMAIL) VALUES(:nom, :prenom, :datenaissance, :ville, :sexe, :email)');
			$req->execute(array(
				'nom' => $_POST['nom'],
				'prenom' => $_POST['prenom'],
				'datenaissance' => $date_bdd,
				'ville' => $_POST['ville'],
				'sexe' => $_POST['genre'],
				'email' => $_POST['email']
				));

		    $reponse = $bdd->query('SELECT * FROM promos WHERE VILLES="'.$ville.'" AND AGE ="'.$age.'" AND (SEXE = "'.$sexe.'" OR SEXE = "3")');
			
			$message = 'Bonjour !'."\r\n";
			$message.= "<p>Merci pour votre inscription, nous vous proposons ces bons plans proches de chez vous, profitez-en !</p>";
			$to      = $_POST['email'];
			$subject = 'inscription réussie';
			$headers = 'MIME-Version: 1.0' . "\r\n";
			$headers .= 'Content-type: text/html; charset=utf-8' . "\r\n";
			$headers .= 'From: contact@aynabtu.info' . "\r\n" .
				 'Reply-To: contact@aynabtu.info' . "\r\n" .
				 'X-Mailer: PHP/' . phpversion();

		    while ($donnees = $reponse->fetch())
		    {
				 
				 $message.= "<p>
								<strong>Promos</strong> : ".$donnees['PROMOS'] ."<br />
								
							</p>"."\r\n";
			}

			 mail($to, $subject, $message, $headers);
		    
		    $reponse->closeCursor();
		}
		catch(Exception $e)
		{
		    die('Erreur : '.$e->getMessage());
		}

?>

    </body>
</html>