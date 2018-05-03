start transaction;

create database `Acme-Explorer`;

use `Acme-Explorer`;

create user 'acme-user'@'%'identified by password
	'*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%'identified by password
	'*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete
	on `Acme-Explorer`.* to 'acme-user'@'%';
grant select, insert, update, delete, create, drop, references, index, alter,
		create temporary tables, lock tables, create view, create routine,
		alter routine, execute, trigger, show view
	on `Acme-Explorer`.* to 'acme-manager'@'%';

-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Newspaper
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_idt4b4u259p6vs4pyr9lax4eg` (`userAccount_id`),
  CONSTRAINT `FK_idt4b4u259p6vs4pyr9lax4eg` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (167,0,'josecarlos_rmd9@hotmail.com','Jose','693448959','666 Rosebud Avenue','Garcia',156);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `CVV` int(11) NOT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `expirationMonth` int(11) NOT NULL,
  `expirationYear` int(11) NOT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `tabooWord` bit(1) NOT NULL,
  `targetPage` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `agent_id` int(11) NOT NULL,
  `newspaper_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7n9ussuxsi3k6rm34vajrccvn` (`agent_id`),
  KEY `FK_2a9jqcvexg35eohaebb71i4xu` (`newspaper_id`),
  CONSTRAINT `FK_2a9jqcvexg35eohaebb71i4xu` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_7n9ussuxsi3k6rm34vajrccvn` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
INSERT INTO `advertisement` VALUES (297,0,'https://www.cocacolaespana.es/content/dam/journey/es/es/private/historia/love-coca-cola/2015/logo-coca-cola-lead.png',450,'VISA',2,2020,'Phaidros Randi','4000990618525905','\0','http://advertisement1.com','Advertisement 1',168,181),(298,0,'https://i.imgur.com/0zw2V.jpg',450,'VISA',2,2020,'Phaidros Randi','4000990618525905','\0','http://advertisement2.com','Advertisement 2',168,182),(299,0,'http://www.diagramconsultores.com/wp-content/uploads/2011/01/carrefour.jpg',450,'VISA',2,2020,'Phaidros Randi','4000990618525905','\0','http://advertisement3.com','Advertisement 3',168,184),(300,0,'https://ugc.kn3.net/i/origin/https://images-na.ssl-images-amazon.com/images/G/01/SellerCentral/legal/amazon-logo_grey.png',389,'MASTERCARD',3,2021,'Randy Gordon','5830174670847761','\0','http://advertisement4.com','Advertisement 4',169,185),(301,0,'https://cdn.voyager.pgsitecore.com/es-ar/-/media/Gillette_AR/Images/Logos/Desktop/gillette-logo.png',389,'MASTERCARD',3,2021,'Randy Gordon','5830174670847761','\0','http://advertisement5.com','Advertisement 5',169,181),(302,0,'http://www.brandemia.org/wp-content/uploads/2011/09/logo_nike_principal.jpg',389,'MASTERCARD',3,2021,'Randy Gordon','5830174670847761','','http://advertisement6.com','Advertisexment 6',170,181);
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5cg6nedtnilfs6spfq209syse` (`userAccount_id`),
  CONSTRAINT `FK_5cg6nedtnilfs6spfq209syse` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (168,0,'agent1@hotmail.com','Agent Name 1','693448959','C/ falsa 123','Agent Surname 1',161),(169,0,'agent2@hotmail.com','Agent Name 2','693448959','C/ falsa 123','Agent Surname 2',162),(170,0,'agent3@hotmail.com','Agent Name 3','693448959','C/ falsa 123','Agent Surname 3',163),(171,0,'agent4@hotmail.com','Agent Name 4','693448959','C/ falsa 123','Agent Surname 4',164);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` text,
  `finalMode` bit(1) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `summary` text,
  `tabooWord` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `newspaper_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_title` (`title`),
  KEY `index_mode` (`finalMode`),
  KEY `FK_pftm848lf5hu8sd0vghfs605l` (`newspaper_id`),
  KEY `FK_b3tb1l9l19i2tfsf6o6a4hifx` (`user_id`),
  CONSTRAINT `FK_b3tb1l9l19i2tfsf6o6a4hifx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_pftm848lf5hu8sd0vghfs605l` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (191,0,'Esta recopilación incluiría los tres títulos del dragón Spyro desarrollados por Insomniac Games (Ratchet and Clank, Spider-Man) que se lanzaron para Playstation entre 1998 y 2000. Serían más de 100 niveles con un lavado de cara gráfico y con controles adaptados a la actualidad. Según la carátula, los responsables de la remasterización serían Toys for Bob, responsables de la franquicia Skylanders (que, recordemos, nació como un spin-off de Spyro).\n\rSegún indican, el juego saldría el 21 de septiembre. Esperaremos a la confirmación oficial para cerrar todos los detalles, pero no debería tardar mucho en llegar; los servidores de la web oficial ya alojan varias imágenes de este juego aún por anunciar.','','2018-04-03 00:00:00','A la web oficial se le escapan algunas imágenes','\0','Amazon México filtra Spyro: Reignited Trilogy',181,172),(192,0,'Firewatch, la aventura indie de Campo Santo que recibió elogios de la crítica en 2016, llegará a Nintendo Switch.\n\rEl estudio ha anunciado hoy esta versión del juego, que estará optimizada para la consola de Nintendo. De momento, eso sí, no hay una fecha de lanzamiento concreta, solo un discreto pronto.\n\rHemos estado trabajando duro desmontando gran parte de la tecnología de Firewatch y reconstruyéndolo para que el mundo se renderizara, hiciera stream y cargara más rápidamente, ha escrito el guionista y diseñador del juego, Jake Rodkin, en el blog de la desarrolladora.\n\rCasi todo el mundo en Campo Santo tiene una Nintendo Switch (y los demás quieren una). Sabemos cómo se siente un buen juego de Switch, y queremos asegurarnos de que Firewatch también se siente así.\n\rLas optimizaciones realizadas para dicha versión llegarán también a las demás plataformas.\n\rFirewatch first se puso a la venta en febrero de 2016 para PC y PlayStation 4 en febrero de 2016. Un año más tarde llegó a Xbox One.\n\rEvitando alardes o florituras innecesarias, el primer juego de Campo Santo se pone automáticamente a la par de los mejores indie actuales, dijimos en su análisis.','','2018-04-04 00:00:00','Llegará pronto.','\0','Anunciado Firewatch para Nintendo Switch',182,174),(193,0,'Skybound Games (The Walking Dead) distribuirá la versión física de The Long Dark - Season One: Wintermute.\n\rEl juego de supervivencia de Hinterland está disponible actualmente en PC, PS4 y Xbox One. Tiene un modo sandbox y un modo historia (Wintermute), del cuál solo se han lanzado dos de los cinco episodios previstos. Quizá la fecha de salida de la edición física sea una pista de cuándo podemos esperar que se complete el modo historia.\n\rThe Long Dark - Season One: Wintermute saldrá en formato físico en PS4 y Xbox One en septiembre.','','2018-04-04 00:00:00','Saldrá en septiembre para PS4 y Xbox One','\0','Habrá edición física de The Long Dark - Season One: Wintermute',182,174),(194,0,'Claro que sabe disparar, pero cuando estaba de siete meses el doctor corta rollos decidió que sería mejor que dejara de practicar con armas de fuego. La frase la firma Nick Rye, propietario de una modesta empresa de fumigación, padre primerizo y redneck federado y con carné, en una de tantas conversaciones casuales con las que tiende a rellenar los silencios incómodos entre bombardeo y bombardeo. La mala fortuna ha querido que su esposa venga a salir de cuentas precisamente la semana en que la secta ha intensificado la ofensiva para hacerse con su pequeño aeródromo, y en cuanto a la criatura que está en camino el bueno de Nick lo tiene claro: a él le pusieron una pistola en las manos apenas aprendió a caminar, pero con ella esperará hasta los cinco años. Porque pese a su apariencia desaliñada y su fascinación por la música country y las cosas que explotan Nick tiene un corazón que no le cabe en el pecho, y en el fondo él mismo sabe que así no se puede vivir. Nos lo recuerda a menudo, lamentándose por radio del papel que le ha reservado toda esta escalada de violencia sin sentido alguno; vamos a tener que luchar mucho antes de que vuelva la paz, asegura. Segundos más tarde identifica un nuevo objetivo, y desciende en picado con su hidroavión mientras proclama a los cuatro vientos que el señor muerte desde el cielo tiene una entrega especial. Suele acertar de lleno, y cuando un nuevo puñado de cuerpos salta por los aires entre gritos de júbilo tiendes a preguntarte qué demonios es lo que esta gente pretende salvar.\n\rLos problemas de tono son evidentes, aunque tampoco es exactamente una novedad: la saga siempre los ha tenido, y esta quinta entrega no es más que un nuevo capítulo en la lucha entre lo que está escrito y lo que no lo está. Entre un guión que quiere hablarnos de la locura, del fanatismo, del embrutecimiento y la bancarrota moral, y un apartado jugable que parece pedir perdón, que lo inunda todo de bombas de fabricación casera y osos persiguiendo a cosechadoras porque debe ser emergente y teme que nos aburramos. Sus personajes glorifican la violencia porque en su mundo es la única moneda de cambio, y aunque el juego va sobrado de escenas que impactan por los motivos correctos su efecto no suele durar. Quizá porque ese bautizo a punta de pistola o ese charlatán que marca a sus feligreses con un punzón oxidado simplemente preceden a una nueva misión sobre recolectar testículos, o porque cuesta crear verdaderos vínculos con una señora que insiste en hacer comentarios sobre nuestro culito. Porque luchamos codo con codo con gente que instala ametralladoras en sus camiones por diversión, y porque a veces cuesta distinguir a buenos y malos. Lo que la secta le está haciendo a esta gente es terrible, pero repeler una oleada de sicarios ciegos de alucinógenos a ritmo de música disco mientras alguien grita improperios contra esos malditos rojos es exactamente el tipo de situación que suele hacerme sentir incómodo.\n\rNo descarto que sea totalmente premeditado, porque Far Cry 5 cae tan a menudo y tan decididamente en la banalización de su propio mensaje que cuesta no ver una cierta intención; una mueca burlona, un Starship Troopers de tractores y recortadas que habla más del caldo de cultivo que del problema en sí mismo. Sea como sea, y apartando el foco de los alegres vecinos del condado de Hope, si algo hay que agradecerle al equipo de guionistas es el retrato de una amenaza que tiene poco de maniquea, y que acierta de lleno al dibujar la personalidad de unos líderes que parecen realmente creer lo que dicen. Pocas sagas trabajan la figura del villano con la contundencia con que lo hace Far Cry, y en este caso tanto Joseph como sus tres hermanos vuelven a echarse el equipo a la espalda en lo narrativo, comiéndose la pantalla en las cinemáticas y derrochando un carisma que tiene un punto de paternal, una presencia tras la que se hace natural imaginar una multitud cargada de antorchas. Están totalmente chiflados, pero sus acólitos hablan de ellos con veneración, y en las paredes de los búnkeres y las iglesias que profanan se suceden pintadas dedicadas a los infieles, a esos que liberan a golpe de machete y kalashnikov y que cuando llegue el final lo agradecerán. Es malsano, es enfermizo, y es exactamente lo que tiene que ser un juego que hable de este tipo de cultos. Por eso deja un regusto amargo que este tipo de momentos sean tan poco frecuentes.\n\rEstán repartidos aquí y allá, en pequeños retazos de narrativa ambiental y en alguna que otra conversación por radio, y cuando se deciden a explotar suele ser al final, como colofón a esas barritas de progreso que la familia encarna en lo estructural: fiel a la receta del estudio, Far Cry 5 plantea su mundo como una sucesión de cajones de arena que divide territorio y organización mafiosa en tres sectores independientes con una sola cabeza, la del Padre, en lo alto del organigrama. Para acceder a ella y dar carpetazo a la invasión habrá que debilitar primero su aparato de captación, su brazo ideológico y el floreciente negocio de manufactura de Gozo, una droga de síntesis que no tardaremos en experimentar en carne propia porque la saga es un animal de costumbres, y hacer todo esto implica lo que todos conocemos de sobra: cumplir misiones, liberar campamentos, sabotear camiones y en general acudir raudo a cualquier punto del mapa coronado con un icono. Es en el sistema de adquisición de estas misiones donde se aprecia una mayor intención de renovar el dibujo, porque las torres de radio han pasado a mejor vida e incluso el propio argumento se atreve a bromear con ello.\n\rA cambio lo que tenemos son personajes, sacerdotes armados hasta los dientes y camareras de armas tomar que se acercan a nosotros con tal o cual encargo y se apresuran a poblar los puestos recién liberados con una sana colección de nuevas tareas, y también una interpretación más flexible y justificada de las propias actividades, incluso las secundarias: descubrir un nuevo lugar de caza implica estar atento a ciertas conversaciones o a las señales de la carretera, y dedicar un pequeño rodeo a investigar el refugio de un fanático de la supervivencia puede hacernos volver a casa con un par de revistas especializas que se traduzcan en nuevos talentos y un sitio estupendo para pescar. En lo meramente estructural es un cambio que se agradece, y aunque en esta casa esto son palabras mayores voy a animarme a decir que acaba recordando un poquito a Fallout. Por ese par de pasitos en los que el sistema al completo se aproxima a los juegos de rol, y porque la propia ambientación, alejada de las islas cuasi desiertas y los picos de las montañas, tiene cierto olor a civilización en las últimas. Hay autobuses abandonados y barricadas construidas con restos de chapas, y también una pequeña comunidad de supervivientes que se ha hecho fuerte en el interior de una cárcel y que se distingue por llevar chapitas que pertenecieron a su equipo de fútbol universitario. Hay mucho de Fallout 3, pero por desgracia poco de lo que hizo grande a New Vegas: hay un montón de buenas ideas, pero pocos esfuerzos para hacerlas funcionar en conjunto y dar sentido a ese festival de las criadillas que se celebra a pocos metros de esa base sectaria atestada de hombres armados.\n\rY es que la sensación de ocupación es constante, y por eso, ya que hablamos de liberar gasolineras a tiros y de ir escalando palmo a palmo por esos marcadores de resistencia que nos permitan molestar lo suficiente a la fiera para que decida dar un zarpazo fuera de su escondite, es importante mencionar otra de las novedades de mayor peso: la posibilidad de hacerlo en compañía. Del cooperativo en sí hablaremos más tarde, pero a falta de un compañero analógico que nos vigile la espalda el juego ofrece hasta nueve secundarios con nombre y apellido dispuestos a jugarse el físico por nosotros. Incluso más, porque aunque el devenir de los acontecimientos y las muy superiores habilidades de los combatientes con ficha y retrato pronto los convertirán en la única opción razonable prácticamente cualquier lugareño con edad para sostener un fusil de asalto será susceptible de ser fichado en caliente: un rehén liberado, una palmadita en la espalda, un nuevo experto en demoliciones listo para la próxima convocatoria. Aun así, como digo, la verdadera chicha está en los Nick Ryes de la vida, un conjunto de inadaptados sociales con especial talento para la aplicación de la segunda enmienda entre los que encontramos francotiradores, pilotos de helicópteros, fans de los lanzallamas e hijos de políticos corruptos a los que por algún motivo les fascinan los lanzamisiles portátiles. Es donde entra en juego esa juguetona torre de radio que comentábamos antes: antes de abandonar la pequeña isla que sirve de improvisado tutorial al juego captaremos nueve señales de auxilio repartidas a lo largo de las tres grandes regiones en que se divide el condado, y cada una de ellas esconde una misión concreta que nos premiará con otro compañero de armas. Así, hacer un nuevo trío de amigos se convierte pronto en el principal aliciente de cada sector recién estrenado, sobre todo porque uno de los slots siempre está reservado a un miembro del reino animal. Hay un perrete, un oso y un puma, y a todos los podemos acariciar. Todo bien en ese apartado.\n\rO quizá no tanto, porque aunque la selección es imaginativa y hay personajes dotados de cierto carisma su desempeño en el terreno de juego es un pelín más errático de lo que nos gustaría. Generalmente cumplen su función, sea esta bombardear un camión cisterna u ocupar el asiento del piloto en un helicóptero para permitirnos hacer el idiota con nuestro paracaídas, pero en lo tocante al libre albedrío hablamos de una IA un tanto fallona, y sobre todo de gente con claras tendencias suicidas que acaba convirtiéndose en una carga en las misiones más peliagudas. No es extraño tener que reanimar a nuestra francotiradora tres o cuatro veces seguidas, y por eso en lo personal suelo decantarme por una combinación de animal y personaje aerotransportado: los primeros son adorables, y los segundos están suficientemente lejos de la acción como para suponer muchas complicaciones. Por eso es preferible optar por la compañía de un segundo jugador siempre que sea posible, y en este sentido se le pueden poner pocos peros a la implementación del cooperativo que ofrece Far Cry: el sistema simplemente funciona, lo que ya debería ser motivo de celebración, y con los escollos técnicos superados lo que nos queda es una experiencia que como ya sucediera en el reciente Ghost Recon Wildlands potencia enormemente el factor comedia, aunque afortunadamente esta vez no se apoye tanto en personajes que comienzan a levitar o camionetas que estallan solas. Técnicamente esta quinta entrega es un juego más que solvente, y saber manejar el tipo de caos que maneja doblando el número de jugadores irresponsables sin que en ningún momento salten los cimientos del decorado es su particular prueba del algodón.\n\rY hablo de caos porque tengo que hacerlo, porque la línea entre el sigilo y el barril rojo sigue antojándose demasiado delgada y porque aunque el juego hace esfuerzos para premiar lo primero suele toparse de bruces con un diseño de misiones demasiado centrado en la oleada, los refuerzos y la defensa de posiciones. En el gatillo fácil y en el espectáculo porque sí, en la barricada de coches quemados que detengan al camión de los malos y en liberar a un lobo para que se coma a los guardias. No ocurre siempre, porque como digo manejar el arco con elegancia es una gozada y porque se trata de un juego en el que resulta relativamente barato ponerle un silenciador a una ametralladora pesada, pero en general el juego es un hijo más de la Ubisoft del número en bruto, la que plantea una cantidad de misiones realmente indecente y llena todos sus escenarios de tirolinas y pasajes subterráneos pero no se detiene a plantear premisas originales. O al menos no siempre, porque de cuando en cuando es el propio argumento el que lucha por abrirse paso en ese océano de metralla y jugabilidad emergente y nos regala alguno de esos momentos en los que brilla la saga; momentos más lineales, sí, pero también mejor planteados, en los que toca escapar nuestro propio bautismo o proteger un puente mortero en mano. Aun así unos y otros son disfrutables, y quienes vengan aquí buscando estampidas de animales salvajes y esa picadora de carne con la que relajarse un rato después del trabajo agradecerán un gunplay marca de la casa que puede abusar un poco del autoapuntado pero soluciona las cosas con contundencia. Disparar en Far Cry sigue sintiéndose realmente bien, aunque a veces le cueste justificarlo.\n\rPor eso el modo Arcade, otra de las sorpresas, es una buena idea: mapas sin contexto ninguno, rondas relámpago, una puntuación al final y que pase el siguiente. Eso es exactamente lo que propone, y aunque la intención se agradece por el momento todo queda en manos de la comunidad y del juego que un puñado de benefactores anónimos decidan sacarle a su editor de mapas. Por posibilidades no quedará porque la selección de entornos firmados por la propia Ubi ya deja intuir una flexibilidad importante y si esa maldita casa de las perspectivas locas ha sido posible no deberíamos tener por qué preocuparnos, pero no es más que un aperitivo. Hay ganas de ver qué resulta de todo esto, pero como poco creo que es un buen ejemplo de una de las mayores virtudes de la saga, y a la vez de uno de sus principales problemas: ese componente salvaje e indómito que funciona como una bomba cuando se aísla en laboratorio pero que podría no maridar tan bien con ese otro Far Cry que quiere contarnos cosas. Es, creo, el único problema real de un juego por lo demás enormemente disfrutable, y la única mancha que emborrona unas escrituras que la compañía insiste en recitar de carrerilla. Con confianza, con fe, pero sin dejar demasiado hueco a nuevas interpretaciones. Con un fervor que ralla en lo religioso.','','2018-04-03 00:00:00','En el nombre del padre.','\0','Análisis de Far Cry 5',183,173),(195,0,'De todas las remasterizaciones que se han publicado a lo largo de estos últimos años la de Dark Souls es, probablemente, la más esperada por muchos jugadores. Es una oportunidad perfecta para revisitar uno de los juegos más queridos de la pasada generación, usando la tecnología actual para mejorar mucho los gráficos y solventar los famosos problemas de rendimiento que tenía el original. Hace unos días ya pudimos echar un vistazo al port para Switch gracias a la publicación de un vídeo con gameplay, quedándonos con la sensación de que se trata de una conversión conservadora para la consola híbrida de Nintendo. Ahora hemos podido jugar a una versión preview en PlayStation 4 Pro, y claramente aquí sí hay mucho que comentar a nivel visual.\n\rComo era de esperar, en la revisión de la consola de Sony el juego es compatible con 4K. Os podemos confirmar que con la salida 4K seleccionada la build actual del juego ofrece una resolución nativa de 3200x1800. No es el 4K nativo que algunos esperaban, pero la densidad de pixeles es suficiente para mostrar una imagen nítida, incluso habiendo escalado para adaptarla a la pantalla Ultra HD. Lo más sorprendente es lo bien que aguanta el diseño del mundo en esta altísima resolución, siete años después del lanzamiento original. La versión para Pro amplía 7,8x veces la cantidad de pixeles respecto a la resolución de 1024x720 de las versiones de PlayStation 3 y Xbox 360.\n\rVeremos qué tal son las otras versiones para consola cuando se acerque el lanzamiento, pero nos pica especialmente la curiosidad la de Xbox One X, donde la potencia extra de la GPU se podría traducir perfectamente en una resolución nativa de 3840x2160, 4K completo. De momento, el hecho es que Dark Souls no tiene problemas en alcanzar 1800p en PS4 Pro y lo mejor es que lo hace a sesenta frames por segundo. Otra buena noticia es que el juego implementa super-sampling, con lo cual los usuarios de televisores 1080p obtendrán un anti-aliasing extra, una ventaja sobre la resolución nativa de la versión para la PlayStation 4 estándar, que se supone es de 1920x1080.\n\rPero dejando de lado la resolución y el frame-rate, ¿hasta qué punto se ha remasterizado el juego? Resulta evidente que las mejoras en el arte no están aseguradas: algunas texturas se mantienen iguales, mientras que otros materiales se han retocado. Buena parte de los assets que hemos visto en el Refugio de los no muertos, por ejemplo, son idénticos a los de Xbox 360, pero en el Santuario de Enlace de Fuego apreciamos texturas y sprites más nítidos en la hierba. Comparados con los borrosos assets del original PlayStation 4 Pro mejora significativamente en este aspecto, para justificar la compatibilidad 4K. Sin embargo las mejoras no son universales, aunque un mejor filtrado de texturas ayuda a sacar más partido del arte original.\n\rEso no quiere decir que From Software no haya introducido algunos cambios sustanciales. Aunque los materiales son a menudo similares al original, el modelo de iluminación de Dark Souls ha cambiado mucho. El resultado es que, pese a reutilizar algunas texturas, la remasterización puede lucir muy distinta gracias a la forma en que el mapeado especular - en las piedras, por ejemplo - interactúa con la luz. La buena noticia es que la remasterización tiene en cuenta la dirección de la luz en las hogueras, haciendo que la perspectiva sea la correcta. Lo mismo ocurre con la neblina en las puertas antes de los jefes, o incluso en el etéreo brillo que emana alrededor de tu propio personaje. Los resultados son radicalmente distintos al original, en ocasiones, siendo a veces más atractivos y en otros más planos cuando comparas la versión de PlayStation 4 Pro con la original de Xbox 360.\n\rLos fans de Dark Souls también notarán un gran cambio en los efectos. Desde el primer jefe del Refugio de los no muertos se observa que las transparencias alpha 2D han sido reemplazadas por un efecto más bonito en PlayStation 4 Pro. Hay un rico efecto en las espirales de polvo, en vez de la textura plana de baja resolución que se usaba en Xbox 360. Se aprecia en todos los enemigos que golpean el suelo, incluyendo el Demonio de Tauro y la primera aparición del Dragón Rojo. También mejora el frecuente efecto de las esferas de almas, que se asemeja al de Dark Souls III. Es más brillante y más nítido, y una vez más tiene sentido que From Software aplique este efecto visual en la actualización. Hay pequeños cambios y mejoras por todas partes, incluyendo la volumétrica, algo evidente en la niebla de las puertas, una técnica que tenía una penalización extrema en los sistemas de anterior generación.\n\rDicho esto, la remasterización suma una multitud de pequeñas mejoras que crean una imagen general distinta, pero la lógica central sigue siendo la misma, con lo cual todo lo que nos gustó en el juego original se mantiene intacto. Cada giro, posición de los enemigos e incluso la retícula de apuntado, HUD o menús siguen siguen siendo los mismos, aunque las imágenes de los objetos y los textos ahora se renderizan a mayor resolución. Quizás el más significativo de los cambios visuales es la iluminación; no solo es más bonita, sino que además no parece afectar al rendimiento por lo que hemos visto hasta ahora.\n\rDe forma similar a Dark Souls II: Scholar of the First Sin, ahora puedes jugar a 60FPS casi estables, con lo cual estamos ante una enorme mejora en el rendimiento respecto a los menos de 30FPS del original. Siendo justos, las primeras zonas del juego, que son a las que hemos tenido acceso, no muestran el motor bajo la mayor carga posible, y en el evento no nos dejaron entrar en Blight Town. Pero en lo que vimos PlayStation 4 Pro rara vez caía por debajo de los 60FPS. Ya sea con el Demonio del Refugio golpeando urnas o pilares o con el complejo shader de pelo del Demonio de Tauro, todos los puntos en los que el juego caía hasta 20FPS en la anterior generación ahora funcionan a unos fluidos 60FPS en PlayStation 4 Pro.\n\rEsto corrige otro gran problema de la saga Souls. Cuando los juegos de From Software se limitan a 30FPS a menudo aparece un defecto de frame-pacing irregular. Esto significaba que aun cuando el frame-rate era de 30FPS, este parecía errático. Al funcionar a 60FPS Dark Souls Remastered no tiene problemas de este tipo en PlayStation 4, y todo se nota muchísimo más fluido. Hasta ahora esto solo se había podido conseguir con el mod DSFix para la versión PC, con lo cual es genial tenerlo por defecto en consola. Sin embargo, en esta preview no hay concordancia total con la tasa de refresco de la pantalla; en determinadas ocasiones hay tirones causados por el streaming, y también alguna caída aislada alrededor de los 55FPS. Localizaciones como Blight Town supondrán la prueba de fuego para la versión final.\n\rDe esta demo nos quedamos con la sensación de que Dark Souls Remastered pinta muy bien. Siempre y cuando no esperes que sea un proyecto tipo remake, como por ejemplo Shadow of the Colossus, esta nueva versión cumplirá con tus expectativas. Los cambios gráficos pueden ser pequeños, pero también son numerosos, hasta el punto de compensar lo uno con lo otro. Si a eso le sumamos la resolución 1800p y los 60FPS en PlayStation 4 Pro, no hay excusa mejor para jugar al primer juego de la saga Dark Souls. Lo cierto es que al preparar este artículo hemos vuelto a ver lo bajo que podía llegar a ser el frame-rate en Xbox 360, cayendo incluso por debajo de los dos dígitos. Solo por los 60FPS ya da la sensación de que esta será la versión definitiva del clásico, pero lo sabremos con seguridad cuando la versión final llegue a las tiendas el próximo día 25 de mayo.','','2018-04-03 00:00:00','Digital Foundry prueba la versión de PS4 Pro','\0','¿Hasta qué punto ha mejorado Dark Souls Remastered el juego original',183,172),(196,0,'De repente se ha convertido en mi juego más esperado de 2018. Kunos Simulazioni, los desarrolladores del brillante Assetto Corsa, se han hecho con los derechos las Blancpain GT Series, probablemente el torneo más saludable del mundo del motor, con una participación de fabricantes muy variada en la que encontramos a Ferrari, Porsche, Lamborghini, Aston Martin, BMW, Mercedes, Bentley, Audi y McLaren. No es una mala lista, desde luego, y las carreras son también más que decentes.\n\r¿Qué es lo que hace que Assetto Corsa Competizione, el juego con licencia oficial que se publicará en Early Access este verano, sea tan atractivo? Para empezar es el esperadísimo regreso de un título que representa como ninguno el deporte del motor fuera de la Fórmula 1, y uno que promete un grado de autenticidad que no puedes encontrar en ningún otro videojuego. No necesito un elaborado modo carrera, loot boxes repletas de mods para los coches o mensajes ficticios de email en los que hacer scroll. Simplemente dame una temporada de carreras reales, contra equipos reales y pilotos que se adhieran a normas reales, gobernada por una simple tabla de puntuación. No necesito nada más.\n\rEn Assetto Corsa Competizione parece que finalmente tendremos el sucesor de GTR 2 que hemos estado pidiendo durante años. De hecho, hasta nos sentimos un poco mal por el estudio británico de Simbin que trabaja en GTR 3, porque gran parte del atractivo de GTR 2 era la licencia de la FIA GT Championship, con las 24 horas de Spa como pieza central, y ahora Assetto Corsa Competizione toma el puesto de sucesor espiritual de esa saga y además se hace con la mítica prueba de resistencia belga. La licencia es gran parte del atractivo, así que debe haberse producido cierta competición por ella.\n\rFue un proceso de negociación muy delicado, así que era necesario mantenerlo en completo secreto hasta que todas las piezas estaban en su sitio, y eso no fue fácil porque la administración de varios aspectos de la licencia es diferente a como era en el pasado, explica Marco Massarutto a nuestros compañeros italianos. La compañía SRO que posee los derechos de las Blancpain GT Series estaba encantada de recibir nuestra propuesta, porque ya conocían Assetto Corsa y les atraía la idea de unir fuerzas para producir un videojuego oficial basado en su liga, pero no eran los únicos participantes en las negociaciones.\n\rLa nueva licencia -y las expectaciones que ella conlleva- implican un nuevo Assetto Corsa, que ahora estará desarrollado con el Unreal Engine 4 para facilitar transiciones dinámicas de día/noche y tiempo. Es lo que esperas en un juego que trata de replicar las 24 horas de Spa, en las cuales, pese a desarrollarse en verano, suele ser habitual ver alguna que otra gota de agua.\n\rEl sistema de partículas del UE4 nos permite emular eficientemente un gran número de efectos, desde la caída de unas pocas gotas a una densa lluvia, y mucho más, explica Massarutto. Los árboles, la vegetación y el público se animarán y serán 3D, lo cual hará que los escenarios de las carreras sean mucho más vivos e inmersivos. Es una de las características en las que hemos cambiado nuestro enfoque respecto al pasado, optando por el tipo de escenario que el público cree que se puede encontrar en un circuito, derivado básicamente de lo que se ve en la televisión durante una retransmisión de F1 o MotoGP.\n\rTodavía hay muchas cosas en el aire, porque no se sabe qué tamaño tendrán los campos, el motor todavía se está optimizando y características como realidad virtual o compatibilidad con tres monitores aún están en proceso de evaluación. No olvidemos que es un motor que evoluciona constantemente y que Epic siempre está interesada en mantener el nivel de compatibilidad con software y hardware lo más alto posible.\n\rDel mismo modo, las versiones para consola, aunque se están teniendo en cuenta en el diseño, puede que todavía estén muy lejos. De hecho, leyendo entre líneas las respuestas de Massarutto, puede incluso que tengamos que esperar a PlayStation 5 y la próxima Xbox para verlas. Lo que debes saber ahora, en cualquier caso, es que la prioridad actual es la versión para PC.\n\rEstamos desarrollando el juego con el Unreal Engine 4. Eso permite portar el juego a diferentes formatos y también en términos jugables y de interfaz de usuario estamos desarrollando AC Competizione para que cumpla todos los requisitos para poder publicarse en consolas, dice Massarutto. Teniendo esto en mente, la elección de qué plataformas se apoyarán y cuándo es un tema de rendimiento: cuando alcancemos la mejor optimización posible en PC, entonces veremos si la actual generación de consolas puede garantizar el nivel de calidad que pretendemos conseguir con las versiones para consola de Assetto Corsa Competizione.\n\rAssetto Corsa Competizione también se verá beneficiado al centrarse en cierto tipo de coches. Sigo pensando que el modelo de conducción del Assetto Corsa original es el mejor en lo que respecta a los turismos, pero no estoy tan convencido con el de los coches de carreras (aunque tampoco es que tenga mucha experiencia con los segundos como para emitir un veredicto). Será interesante, pues, comprobar como Kunos retrata en Blancpain las características de cada vehículo. Aparte, habrá una mejora general en el control del que se verán beneficiados todos los coches del juego.\n\rSi miras nuestro historia de desarrollo, verás que Ferrari Virtual Academy era una evolución de su predecesor, netKar PRO, y al mismo tiempo hay un gran salto generacional entre esos dos juegos y Assetto Corsa. Con AC Competizione habrá otro salto, en todos los aspectos. Las físicas se beneficiarán de nuestra experiencia y de un nuevo enfoque en los modelos de los neumáticos y las deformaciones, en la transmisión, en la suspensión y en la aerodinámica, que será más profundo y específico en relación al deporte que estamos reproduciendo.\n\rEsto también conlleva otras cosas, como el cambio de pilotos en las pruebas de rendimiento para un jugador o multijugador, y el calendario completo y los equipos se implementarán en el juego (Zolder y Paul Ricard se añadirán a la actual selección de Assetto Corsa, y los antiguos se mejorarán en el paso al nuevo motor). Es ni más ni menos que el juego oficial de las Blancpain Series, algo que parece simple pero que, si todo sale bien, será poco menos que uno de los videojuegos de carreras más emocionantes de los próximos años.','','2018-04-04 00:00:00','Hablamos de Assetto Corsa Competizione','\0','Entrevista con Marco Massarutto, co-fundador de Kunos Simulazioni',185,172),(197,0,'Puede que se trate de una simple coincidencia o que tras esta decisión se esconda un dedo acusador y cierta amargura, pero el asunto es que la historia que cuenta Summerset tiene bastante miga. El planteamiento es sencillo: el archipiélago de Estivalia, hogar ancestral de los altos elfos, origen de la magia y cuna de una civilización aislada del mundo desde tiempos inmemoriales ha decidido abrir sus fronteras. Sobre el papel, y con el nuevo edicto real en la mano, cualquier extranjero que se aproxime a su orilla tendría derecho a asilo sin que importe su procedencia, pero en la realidad las cosas son diferentes. Nosotros mismos encarnamos a un recién llegado, un inmigrante que no ha cruzado el estrecho en una patera pero tarda bien poco en sentir en sus carnes el verdadero alcance del edicto real, ese pedazo de papel mojado que nos permite pasear por sus playas, recorrer sus caminos y detenernos a charlar con sus comerciantes, pero que no nos garantiza ser bienvenidos. Lo mismo sucede con quienes llegaron antes, con elfos y humanos y khajiit que decidieron hacer las maletas en busca de una vida mejor y nos revelan entre susurros que no se sienten seguros. Al menos así lo hacen quienes todavía pueden hacerlo: hay desapariciones, y rumores de sangrientos ritos daédricos, y poderosas fuerzas en juego. Al describir su mundo o la arquitectura de esa imponente ciudad de torres altas y piedra blanca que saluda a los navegantes el estudio habla de fantasía, pero la historia que encierran es dolorosamente real.\n\rQuizá por eso resulta irónico que una expansión que habla tanto y tan decididamente del prejuicio y la xenofobia se muestre tan preocupada por hacer sentir como en casa al jugador que llega de nuevas. Tanto es así que sus responsables prefieren hablar de un nuevo capítulo, un punto de partida diferente que incluye el juego base en el mismo paquete pero en absoluto requiere de un progreso previo para pasar a la acción. La propia zona del tutorial, un pequeño laberinto de salas de apariencia onírica de las que tocará escapar tras familiarizarnos con todos los conceptos básicos, recuerda poderosamente al que nos daba la bienvenida en el original, y una vez superada esta breve formalidad lo que nos encontramos es una curva de entrada bastante suave que no bombardea al jugador con la clásica avalancha de estadísticas y porcentajes propia del género. Nuestra partida en la sesión de prueba comenzaba así, desde el principio y con un personaje en pañales recién salido del editor, y a lo largo de cerca de un par de horas nuestro principal cometido fue hablar. Charlar con los lugareños, detenernos en encrucijadas del camino para investigar tal o cual entuerto e ir acumulando recados con los que seguir tirando del hilo. Y más allá de la narrativa en sí misma diría que, como en el caso de Morrowind, la intención aquí es la de captar a un nuevo tipo de público. Un público que disfruta de la franquicia pero recela del MMO, y al que el juego saluda en su desembarco con su particular estatua de la libertad: un componente argumental fuerte y una cadena de quests (cercana a las 30 horas, aseguran) con la suficiente enjundia como para seducir al jugador solitario.\n\rComo digo, la mayoría de estos encargos tendrán que ver, o al menos así lo hacen en un principio, con el delicado equilibrio de fuerzas reinante en esa tierra prometida que quizá no lo es tanto. La reina, principal valedora de la nueva política de puertas abiertas, se ha ausentado de la región, y en su ausencia será uno de sus agentes, un James Bond de apariencia felina y carácter afable, quien nos guíe a través del tumultuoso laberinto político resultante. Por el momento sabemos dos cosas: que los opositores al régimen han puesto en marcha un sistema de evaluación de nuevos candidatos a la ciudadanía que esconde un programa de exterminio encubierto, y que a nuestro compañero no parece gustarle trabajar demasiado. En lo jugable será él quien nos asigne nuevas pesquisas y mantenga convenientemente actualizada nuestra colección de waypoints, pero el trabajo sucio nos lo reserva a nosotros: vamos a interrogar a nobles, vamos a dar esquinazo a los guardias y vamos a colarnos en monasterios que esconden oscuros secretos. Sin embargo, si algo llama la atención durante estas primeras horas es que raramente vamos a desenvainar el acero.\n\rAl menos así será si actuamos de manera obediente y centramos nuestros esfuerzos en una secuencia de misiones principales que gira en torno a la imponente ciudad de Shimmerene, uno de los ocho grandes núcleos urbanos que encierra la isla y un marco que recuerda por escala y arquitectura a la Ciudad Imperial de Oblivion. Pero nada nos impide ignorarla, y de las breves excursiones fuera de pista en las que nos pudimos aventurar lo que sacamos en claro fue el regreso de un sistema de combate que promete novedades, pero que sigue sintiéndose como una versión un puntito menos física de lo visto en la saga madre. Para los profanos, hablamos de la clásica mezcla de estocadas y tajos en primera persona aderezada con una sana colección de habilidades especiales que en esta ocasión, y por exigencias del guión, estrena una nueva rama de desarrollo relacionada con la manipulación temporal. Y hablo del guión porque su desbloqueo vendrá estrechamente relacionado con la orden de Psijic, una organización de estudiosos de la magia que jugará un papel importante en el argumento y que por primera vez en la historia de la saga permitirá al jugador visitar su lugar de origen, una isla apartada del tiempo y el espacio llamada Artaeum. No suena mal, aunque en términos de extensión y mapeado en bruto no parece que vaya a ser necesario optar por alternativas tan exóticas: a juzgar por los planos mostrados por el equipo de desarrollo en la presentación previa el territorio de las islas parece extenderse a lo largo de una región comparable a la propia Vvardenfell que vimos en Morrowind, y no es algo que se agote en un fin de semana.\n\rBuenas noticias, sin duda, porque la escala parece intacta y porque la ambientación isleña no viene con letra pequeña. Puede que el nombre no venda tanto, pero estamos ante una expansión igual de ambiciosa que además cuenta con una carta incluso más poderosa que la nostalgia que pudiera provocar Morrowind: permitirnos visitar un entorno que siempre ha estado ahí, en los libros y en las leyendas, pero que no se trasladaba al videojuego desde 1994, desde ese The Elder Scrolls: Arena que vio nacer a la saga. Observarlo entonces y ahora, pasear por sus calles y por sus plazas con el recuerdo de aquellas torpes tres dimensiones tiene algo de mágico, y no es raro sentir el peso de la historia y la sensación de que transitas un territorio realmente vedado, un continente cerrado al mundo que ahora se vuelve a abrir. Un lugar hecho de arena y roca, de bosque y mar, que nos pertenece a todos y en el que nadie debería sentirse un extraño.','','2018-04-04 00:00:00','America First','\0','Avance de The Elder Scrolls Online: Summerset',185,173),(198,0,'El niño de 8 años Gabriel Cruz falleció de muerte violenta en la barriada de Las Hortichuelas, en Níjar «una o dos horas después de comer», según el informe ampliatorio de la autopsia que ya tiene en su poder el juez de instrucción número 5 de Almería, Rafael Soriano.\n\rLa autopsia recoge que las muestras del contenido estomacal remitido al Instituto Nacional de Toxicología, con sede en Sevilla, revelan un fallecimiento en las primeras horas del presunto secuestro a manos de Ana Julia Quezada, quien lo llevó a la finca familia de Rodalquilar, situada a unos cinco kilómetros de la casa de la abuela paterna en Las Hortichuelas. El informe preliminar dató el deceso el mismo día de su desaparición, el 27 de febrero, y apuntó como causa de la muerte asfixia.\n\rEn su auto de ingreso en prisión, el magistrado Rafael Soriano sostiene que «resulta presuntamente incuestionable la participación» de Quezada en la muerte del menor y asegura que de su comportamiento «se infiere una malvada voluntad dirigida especialmente a asegurar la comisión del crimen».\n\rIndica que, como parte de ese «macabro plan criminal», se intentó dotar de una coartada haciendo labores de pintura en la finca de Rodalquilar, en Níjar, y que actuó supuestamente para tratar de «despistar a los agentes de la autoridad que practicaban la búsqueda» hasta encontrar el «momento» de poder «hacer desaparecer el cuerpo».\n\rEl juez instructor destaca que enterró su cuerpo sin vida en un «hoyo que previamente había hecho con una pala» y luego quiso deshacerse del cadáver en un invernadero de acuerdo a las intervenciones telefónicas practicadas y cuyo contenido está en una pieza separada.\n\r«Las pruebas revelan, presuntamente, una falta de sentimientos y humanidad que ella misma ha calificado, que, de ser ciertas, serían de pura crueldad», concluye para remarcar las «abrumadoras pruebas contra ella» no solo «porque ella misma ha reconocido el luctuoso suceso» sino también por las intervenciones acordadas judicialmente y a las pruebas recopiladas por los agentes de la Unidad Central Operativa (UCO) de la Guardia Civil.\n\rMás testificaciones\n\rEl juez ha ordenado una nueva tanda de testificales en el marco de la causa abierta por la muerte violenta del niño de ocho años Gabriel Cruz en la barriada de Las Hortichuelas, en Níjar, y ha llamado a comparecer en sede judicial a diez personas, entre los que se encuentran algunos familiares del pequeño.\n\rEn un auto, consultado por Europa Press, cita a dos de estas personas para el próximo día 10, a las 10.00 horas, mientras que los ocho restantes, entre los que hay un agente de Policía Local, deberán declarar en calidad de testigos el día 19, a la misma hora. El juez ha acordado, asimismo, prorrogar el secreto decretado sobre las actuaciones por un mes más al considerar que no han cambiado las circunstancias que dieron lugar a esta resolución.\n\rPatricia Ramírez y Ángel Cruz, padres de Gabriel, ya comparecieron el 22 de marzo durante dos horas ante el magistrado en calidad de testigos y acompañados por los letrados Francisco y Miguel Ángel Torres ya que se han personado como acusación particular en las diligencias que se siguen contra Ana Julia Quezada, excompañera sentimental del progenitor, por la presunta comisión de delitos de asesinato, detención ilegal y contra la integridad moral.\n\rPoco antes de la cita, remitieron un comunicado a los medios de comunicación en que aseguraban que se enfrentaban «sin duda» a «uno de los días más duros». El juez instructor les tomó declaración por separado para indagar en aspectos que permitan aclarar cuál era la relación del niño con Quezada y conocer detalles de su comportamiento hacía ellos durante los 13 días en los que se mantuvo su búsqueda desde que se perdiera su rastro el 27 de febrero en Las Hortichuelas.\n\rDurante este periodo, según considera indiciariamente la investigación y se recoge en el auto de ingreso en prisión provisional, comunicada y sin fianza, de la autora confesa de la muerte, «dio una falsa apariencia de preocupación por la desaparición y suerte del niño» y «mantuvo el engaño, aumentándolo hasta el punto de colocar ella misma una camiseta del menor en el monte».\n\rEl magistrado Rafael Soriano también tomo declaración en calidad de testigo el 23 de marzo a la abuela paterna de Gabriel, de 84 años. Compareció durante media hora y, según los abogados de la acusación particular, fue un trance «muy doloroso». Ella estaba junto a Gabriel y la única sospechosa del crimen cuando se vio por última vez con vida al pequeño y la investigación sostiene que esta última «aprovechó un momento temporal en el que sabía a solar con el niño y que la abuela no lo iba a controlar» para, mediante «engaño» o «promesa de devolverlo pronto a jugar», llevárselo a la finca familiar de Rodalquilar en la que habría ocultado el cadáver.','','2018-04-04 00:00:00','Además, el juez llama a comparecer a diez personas, entre los que se encuentran algunos familiares del pequeño','\0','La autopsia de Gabriel Cruz revela que murió «una o dos horas después de comer»',185,174),(199,0,'El expresidente de la Generalitat Carles Puigdemont ha enviado este jueves una carta a sus compañeros de grupo parlamentario en la que pide «preservar los derechos del diputado Jordi Sànchez como candidato a la Presidencia de la Generalitat de Cataluña» y en la que descarta su propia investidura. A su vez, Sànchez ha recogido el guante y ha aceptado volver a presentarse, a pesar de estar preso en Soto del Real.\n\rEn su misiva, Puigdemont defiende que la resolución del Comité de Derechos Humanos de la ONU sobre Sànchez difundido hace días es un «aval» a la investidura del expresidente de la ANC. «Hacerlo -proceder a su investidura- es un acto de justicia que repara el daño causado por los poderes del Estado español», señala el expresidente cesado.\n\rLa carta de Puigdemont ha sido respondida rápidamente por Jordi Sànchez, que ha señalado en otra misiva -a la que ha tenido acceso ABC- que proponer su investidura es «una decisión justa jurídicamente y necesaria políticamente». «Es evidente que el Estado español no tiene otra opción que hacer respetar la resolución del Comité de Derechos Humanos. No hacerlo sería una escándalo jurídico mayúsculo», agrega el diputado de Junts per Catalunya.\n\rFinalmente, otro diputado de Junts per Catalunya, en este caso el excandidato a la presidencia -hoy preso en Estremera- Jordi Turull, se ha unido a esta mañana epistolar y ha mandado una carta al presidente del Parlament Roger Torrent, en la que también renuncia a su investidura.\n\r«De forma provisional y en función de como se desarrollen los hechos, retiro mi candidatura a la presidencia de la Generalitat», señala Turull. Asimismo, el exportavoz del Gobierno catalán denuncia que su debate de investidura, celebrado hace menos de un mes, «quedó interrumpid en contra de la voluntad de la cámara» al ser detenido y encarcelado antes de poder celebrar la segunda vuelta del debate.\n\rSànchez vuelve a postularse a la presidencia de la Generalitat después que el abogado defensor del diputado de Junts per Catalunya manifestara en marzo ante el Tribunal Supremo -durante una vista en la que se revisó un recurso pidiendo su libertad- que su cliente iba a renunciar a su acta de diputado y volvería a dedicarse a la docencia.\n\rFuentes de la acusación -ejercida por Vox- presentes en dicha vista, informaron en ese momento de que en dos ocasiones el abogado defensor explicó a los magistrados de que su cliente tenía intención de renunciar a su acta parlamentaria, algo que el propio Sànchez ha desmentido desde entonces.\n\rParalelamente, fuentes del Supremo citadas por Efe confirmaron que el letrado aseguró que su representado nunca había estado en política, sino en la docencia, a la que podría volver, y que lo que quería realmente era salir en libertad, abrazar a sus hijas, y si eso pasaba por renunciar a la política, estaría dispuesto a ello. Parece que se lo ha repensado.','','2018-04-03 00:00:00','El expresidente manda una carta desde Alemania en la que defiende la candidatura del expresidente de la ANC. Paralelamente, Jordi Turull -el último candidato de los independentistas, hoy preso en Estremera- renuncia a su investidura','\0','Puigdemont enreda desde la cárcel y Sánchez se vuelve a proponer como candidato',186,174),(200,0,'Llevan más de un lustro instalados en el barrio de la Guindalera, en la zona del parque de las Avenidas del distrito de Salamanca. Son un nutrido grupo de rumanos de etnia gitana que practican la mendicidad. «A lo largo de la avenida de Bruselas desde la Iglesia de San Bautista hasta más de la mitad de la calle se instalan en la puerta de los bancos, tiendas, mercados, metro... Llegan temprano, sobre la ocho, y suelen acabar a la hora de comer. A veces se hacen relevos entre ellos», coinciden Martín y Manuela. En función de la época puede haber 15 o 20.\n\r«Yo he visto cómo las mafias los traen todos los días en furgonetas y los reparten a cada uno en su puesto, que es exclusivo. En ocasiones han llegado algún búlgaro y han reñido. He escuchado decir: Este es mi sitio, largo de aquí», precisa José Luis.\n\rEste hombre se queja de que algunos de esos pedigüeños son muy insistentes y, además de agitar el bote que llevan con monedas delante de sus narices, les increpan si no les dan dinero. No es lo habitual. «La mayoría de la gente de esta zona es mayor y no sé lo que se deben pensar, que somos ricos o que nos sobra el dinero», indica.\n\rLos residentes interrogados por ABC ignoran el motivo elegido para que esa calle y sus aledaños concentren parte de la mendicidad de la capital, a pesar de no ser un lugar céntrico. «Se han adueñado de la zona, en particular de la avenida de Bruselas por ser la única vía comercial. Los rostros van cambiando, los hay jóvenes, más mayores, sin piernas...», agrega Ricardo. «Yo les daba al principio, hasta que me di cuenta de lo que estaba fomentando».\n\r«La mendicidad es su medio de vida. Si obtienen 20-30 o 40 euros aunque tengan que dar a sus explotadores van tirado», indica Jose. Relata, molesto, lo que le ocurrió con un joven rumano. «Le dije que si no prefería trabajar en lugar de pedir y me espetó que le dijera dónde había un empleo. Le envié a la parroquia, a la que recurren las personas que necesitan cuidadores para ancianos, tareas domésticas, niños, etc. ¿A qué no sabes qué contestó? Que él no valía para eso. Claro, es más fácil vivir como vive», concluye.\n\rPepe agrega: «Algunos en misa te dan la paz y luego te piden al salir a la calle». Relata que hubo una temporada en la que unas jóvenes bien vestidas seguían a los mayores que iban en andador y con la excusa de preguntarles la hora, les robaban.\n\rDebajo del puente de la A-2, en la avenida de Camilo José Cela un grupo que se reúne para dormir. «Llegan a partir de las ocho, pueden ser unos 20 o 30, hacen fogatas para cocinar, apilan mantas, cartones y hacen sus necesidades junto a los pilares, incluso llegando a practicar sexo», indica María. No miente. El hedor es insoportable.\n\rA media mañana no hay nadie. Solo bolsas colgadas en la pared y colchones que un operario del área de Medioambiente del Ayuntamiento de Madrid recoge para tirar. «Esto es a diario. Tiramos todo lo que dejan en el suelo. Ahí arriba, enfrente, tienen más trastos guardados», explica, mientras deposita una colchoneta en su camión.\n\rEntre unos matorrales tienen bandejas de carne picada, filetes de pollo, tomates... Es su despensa. Les da el sol y abundan las moscas. Sobre los arbustos, hay una sartén con restos de carne cocinada. «Algunos se lavan en la fuente y se llevan las garrafas con el agua. Esto es tercermundista y nadie lo ataja».','','2018-04-03 00:00:00','Los vecinos se quejan de esa práctica y del campamento que han montado en el que hacen fogatas para cocinar y pernoctar','','«Los rumanos se han adueñado del parque de las avenidas para ejercer la mendicidad',186,174),(201,0,'Llevan más de un lustro instalados en el barrio de la Guindalera, en la zona del parque de las Avenidas del distrito de Salamanca. Son un nutrido grupo de rumanos de etnia gitana que practican la mendicidad. «A lo largo de la avenida de Bruselas desde la Iglesia de San Bautista hasta más de la mitad de la calle se instalan en la puerta de los bancos, tiendas, mercados, metro... Llegan temprano, sobre la ocho, y suelen acabar a la hora de comer. A veces se hacen relevos entre ellos», coinciden Martín y Manuela. En función de la época puede haber 15 o 20.\n«Yo he visto cómo las mafias los traen todos los días en furgonetas y los reparten a cada uno en su puesto, que es exclusivo. En ocasiones han llegado algún búlgaro y han reñido. He escuchado decir: Este es mi sitio, largo de aquí», precisa José Luis.\nEste hombre se queja de que algunos de esos pedigüeños son muy insistentes y, además de agitar el bote que llevan con monedas delante de sus narices, les increpan si no les dan dinero. No es lo habitual. «La mayoría de la gente de esta zona es mayor y no sé lo que se deben pensar, que somos ricos o que nos sobra el dinero», indica.\nLos residentes interrogados por ABC ignoran el motivo elegido para que esa calle y sus aledaños concentren parte de la mendicidad de la capital, a pesar de no ser un lugar céntrico. «Se han adueñado de la zona, en particular de la avenida de Bruselas por ser la única vía comercial. Los rostros van cambiando, los hay jóvenes, más mayores, sin piernas...», agrega Ricardo. «Yo les daba al principio, hasta que me di cuenta de lo que estaba fomentando».\n«La mendicidad es su medio de vida. Si obtienen 20-30 o 40 euros aunque tengan que dar a sus explotadores van tirado», indica Jose. Relata, molesto, lo que le ocurrió con un joven rumano. «Le dije que si no prefería trabajar en lugar de pedir y me espetó que le dijera dónde había un empleo. Le envié a la parroquia, a la que recurren las personas que necesitan cuidadores para ancianos, tareas domésticas, niños, etc. ¿A qué no sabes qué contestó? Que él no valía para eso. Claro, es más fácil vivir como vive», concluye.\nPepe agrega: «Algunos en misa te dan la paz y luego te piden al salir a la calle». Relata que hubo una temporada en la que unas jóvenes bien vestidas seguían a los mayores que iban en andador y con la excusa de preguntarles la hora, les robaban.\nDebajo del puente de la A-2, en la avenida de Camilo José Cela un grupo que se reúne para dormir. «Llegan a partir de las ocho, pueden ser unos 20 o 30, hacen fogatas para cocinar, apilan mantas, cartones y hacen sus necesidades junto a los pilares, incluso llegando a practicar sexo», indica María. No miente. El hedor es insoportable.\nA media mañana no hay nadie. Solo bolsas colgadas en la pared y colchones que un operario del área de Medioambiente del Ayuntamiento de Madrid recoge para tirar. «Esto es a diario. Tiramos todo lo que dejan en el suelo. Ahí arriba, enfrente, tienen más trastos guardados», explica, mientras deposita una colchoneta en su camión.\nEntre unos matorrales tienen bandejas de carne picada, filetes de pollo, tomates... Es su despensa. Les da el sol y abundan las moscas. Sobre los arbustos, hay una sartén con restos de carne cocinada. «Algunos se lavan en la fuente y se llevan las garrafas con el agua. Esto es tercermundista y nadie lo ataja».','\0','2018-05-01 00:00:00','Los vecinos se quejan de esa práctica y del campamento que han montado en el que hacen fogatas para cocinar y pernoctar','\0','«Los rumanos se han adueñado del parque de las avenidas para ejercer la mendicidad',187,172),(202,0,'Mientras espera la evolución de las dolencias de Jesús Vallejo (en el primer entrenamiento de la semana se ejercitó aparte del grupo) que le impidieron estar disponible ante el Atlético de Madrid, Zidane medita cómo recomponer el sudoku en el que se ha convertido la defensa que alineará ante la Juventus (miércoles 11, 20:45h., beIN). Para este encuentro sólo cuenta con un central disponible, Varane. Sergio Ramos está sancionado y Nacho sigue recuperándose de su lesión en el músculo semitendinoso del muslo derecho. Mientras, el técnico francés baraja la posibilidad de alinear al central aragonés si se recupera o bien volver a situar a Casemiro en el eje de la zaga. Si opta por esta segunda opción, Kovacic jugaría en el centro del campo junto con Modric, Kroos e Isco o Asensio, sin olvidar a Lucas Vázquez. La decisión del francés de no alinear al brasileño en el derbi suscita las dudas de que Vallejo no llegue a estar disponible para el encuentro ante los juventinos.','','2018-04-07 00:00:00','Zidane cuenta ante la Juve con las bajas de Nacho y Ramos y la duda de Vallejo. Si el aragonés no se recupera de sus molestias, piensa en el brasileño como central.','\0','Casemiro, solución de urgencia',189,172),(203,0,'A Cristiano Ronaldo se le ha roto el reloj. Con 33 años, el portugués se ha empeñado en negar las cifras que arroja su DNI y sigue mejorando al \'coche fantasma\' que le marca el paso de los mejores números de su carrera. Este 2018 está reventando las estadísticas. Nunca ha marcado más a estas alturas... ni ha jugado menos.Con su tanto del derbi, el delantero blanco suma 24 goles en 15 encuentros en lo que va de año natural. A razón de 1.6 dianas por partido. Una bestialidad con la que supera a todos los anteriores \'Cristianos\'. Los que eran más jóvenes que él, a los que les importaba menos su físico, las rotaciones o los descansos.','\0',NULL,'El vértigo de un Madrid sin Cristiano.','\0','Un Cristiano inigualable',188,172),(204,0,' Como ya informó ESTADIO Deportivo en el pasado mes de febrero, el Betis se interesó por la situación de Vicente Gómez en el pasado mercado de invierno. El centrocampista canario fue uno de los jugadores más utilizados por Quique Setién cuando este aún entraba a Las Palmas, además tuvo un gran rendimiento y a día de hoy sigue manteniendo una gran relación de amistad con el actual entrenador del Betis.Ahora, según informa el diario Marca, el Betis podría volver a a la carga por el jugador este verano. Hay que recordar que, a pesar de que Vicente Gómez tiene contrato con la entidad canaria hasta 2020 y una cláusula de rescisión de 30 millones de euros, el más que posible descenso de Las Palmas haría que su situación cambiase de forma radical. ','','2018-04-09 00:00:00','El Betis preguntó por Vicente Gómez','\0','Vicente Gómez vuelve a la órbita del Betis',190,172),(205,0,' El Betis visita este miércoles el Palau Blaugrana para enfrentarse al Barcelona Lassa en una cancha de máxima dificultad donde solo venció tres veces en su historia, la última en 2008, un espejo donde los sevillanos quieren reflejarse con la necesidad de salir del descenso. El Barcelona del serbio Svetislav Pesic, que se encuentra tercero en la tabla pero es el segundo que más puntos anota (2.303), quiere seguir mostrando su fortaleza en el Palau tras ganar en Gran Canaria la pasada jornada.','','2018-04-09 00:00:00','El Betis, con la necesidad de repetir la hazaña de 2008 en el Palau','\0','El Betis debe ganar',190,172);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_pictures`
--

DROP TABLE IF EXISTS `article_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_pictures` (
  `Article_id` int(11) NOT NULL,
  `pictures` text,
  KEY `FK_slh5rr6y2n4ml5s20v5nlr52g` (`Article_id`),
  CONSTRAINT `FK_slh5rr6y2n4ml5s20v5nlr52g` FOREIGN KEY (`Article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_pictures`
--

LOCK TABLES `article_pictures` WRITE;
/*!40000 ALTER TABLE `article_pictures` DISABLE KEYS */;
INSERT INTO `article_pictures` VALUES (191,'https://cdn.gamer-network.net/2018/articles/2018-04-05-09-44/Spyro_Reignited_Trilogy_Amazon_MX_04_05_18.jpg/EG11/resize/300x-1/quality/75/format/jpg\n			'),(192,'https://cdn.gamer-network.net/2018/articles/2018-04-05-13-53/tumblr_p6m6zsvSEI1sikueao1_1280.png\n			'),(194,'https://cdn.gamer-network.net/2018/articles/2018-03-26-10-46/Blessed_1080p_March26_12pmCET_1522054947.jpg\n				'),(194,'https://cdn.gamer-network.net/2018/articles/2018-03-26-10-09/pin.jpg\n				'),(194,'https://cdn.gamer-network.net/2018/articles/2018-03-26-10-46/Down_the_hill_1080p_March26_12pmCET_1522054948.jpg\n				'),(195,'https://cdn.gamer-network.net/2018/articles/2018-04-04-08-51/Pro_000.jpeg\n				'),(195,'https://cdn.gamer-network.net/2018/articles/2018-04-04-08-52/Pro_001.jpeg\n				'),(195,'https://cdn.gamer-network.net/2018/articles/2018-04-04-08-52/Pro_002.jpeg\n				'),(195,'https://cdn.gamer-network.net/2018/articles/2018-04-04-08-52/Pro_003.jpeg\n				'),(195,'https://cdn.gamer-network.net/2018/articles/2018-04-04-08-52/Pro_004.jpeg\n				'),(195,'https://cdn.gamer-network.net/2018/articles/2018-04-04-08-52/Pro_005.jpeg\n				'),(198,'http://www.abc.es/media/espana/2018/04/05/autopsia-gabriel-cruz-k3SH--1240x698@abc.jpg\n			'),(200,'http://www.abc.es/media/espana/2018/04/03/mendicidad111-kP3B--1240x698@abc.jpg\n				'),(200,'http://www.abc.es/media/espana/2018/04/03/mendigos11-kP3B--510x349@abc.jpg\n				'),(201,'http://www.abc.es/media/espana/2018/04/03/mendicidad111-kP3B--1240x698@abc.jpg\n				'),(201,'http://www.abc.es/media/espana/2018/04/03/mendigos11-kP3B--510x349@abc.jpg\n				'),(202,'https://es.wikipedia.org/wiki/Casemiro#/media/File:Shahter-Reak_M_2015_(16).jpg\n				'),(203,'https://es.wikipedia.org/wiki/Archivo:New_Zealand-Portugal_(20).jpg\n				'),(204,'http://www.timejust.es/wp-content/uploads/2018/02/Betis_-_Real_Madrid_-_Fernando_Ruso_-_2293.JPG.950x600_q85_crop-center.jpg\n\n				'),(205,'http://zetaestaticos.com/diariolagrada/img/noticias/0/017/17566_1.jpg\n\n				');
/*!40000 ALTER TABLE `article_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chirp`
--

DROP TABLE IF EXISTS `chirp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chirp` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` text,
  `moment` datetime DEFAULT NULL,
  `tabooWord` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_taboo` (`tabooWord`),
  KEY `FK_t10lk4j2g8uw7k7et58ytrp70` (`user_id`),
  CONSTRAINT `FK_t10lk4j2g8uw7k7et58ytrp70` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chirp`
--

LOCK TABLES `chirp` WRITE;
/*!40000 ALTER TABLE `chirp` DISABLE KEYS */;
INSERT INTO `chirp` VALUES (206,0,'Ya podéis ver E3: LA PELÍCULA en este enlace: https://www.youtube.com/watch?v=6_5cJRVv-N4 … Ya nos diréis qué os ha parecido! #E3lapelicula','2018-04-04 18:19:14','\0','E3: LA PELÍCULA',172),(207,0,'NeoGAF offline after owner accused of sexual misconduct - http://www.eurogamer.net/articles/2017-10-23-neogaf-offline-after-owner-accused-of-sexual-misconduct','2018-03-03 18:28:54','','Sexual scandal',172),(208,0,'Assassin\'s Creed Origins recibirá un menú para activar trucos en PC. Podremos modificar el juego con el \'panel de control del Animus\'.','2018-03-11 20:13:44','\0','Novedades AC:Origins',172),(209,0,'El creador de UnEpic lanza un Kickstarter para su proyecto Afraid, un juego sobre ONGs que te permitirá ayudar a organizaciones reales.','2018-03-13 13:21:23','\0','Nuevo indie sobre ONGs',172),(210,0,'Un juego chiquitín que no sólo es una delicia de jugar, sino que tiene el potencial para cambiar nuestra forma de entender los videojuegos. Análisis de Minit.\n\rhttps://www.eurogamer.es/articles/minit-analisis','2018-03-30 14:58:36','\0','Esos pequeñenines',172),(211,0,'Valve: \'Es cierto que las Steam Machines no están volando de las estanterías\'. La compañía responde tras eliminarlas de la pestaña de hardware de Steam.','2018-03-31 16:48:29','\0','Declaracion de Valve sobre su consola',172),(212,0,'Que Mariano Rajoy no es Wiston Churchill lo reconocería hasta un niño de diez años. Aun así, el presidente del Gobierno es conocido por ser un muy buen parlamentario. Que no orador.','2017-06-13 18:03:15','\0','Cuanto peor mejor para todos y cuanto peor para todos mejor, mejor para mí el suyo, beneficio político.',173),(213,0,'El presidente del Gobierno vuelve a hacerse un lío con las palabras en un acto de su partido en Benavente (Zamora) y señala que \'es el vecino el que elige el alcalde y es el alcalde el que quiere que sean los vecinos el alcalde\' tras señalar que el PP ganó las elecciones municipales en la localidad y no gobierna.','2015-12-02 18:21:51','\0','Es el vecino el que elige al alcalde y es el alcalde el que quiere que sean los vecinos el alcalde.',173),(214,0,'El presidente del Gobierno comete un traspiés lingüístico al referirse a su declaración de \'persona non grata\' en Pontevedra durante una entrevista en Espejo Público.','2016-02-25 15:37:28','\0','Somos sentimientos y tenemos seres humanos',173),(215,0,'Después de dar mucho de qué hablar con su pregunta sobre la nacionalidad \'europea\', el presidente del Gobierno, Mariano Rajoy, concedió ayer miércoles una entrevista a Televisió de Girona donde dejó otra \'perla\' al referirse a lo que dicen los tratados europeos sobre la posibilidad de que Cataluña se mantenga en la UE.','2015-09-24 16:34:02','\0','Realmente un vaso es un vaso y un plato es un plato',173),(216,0,'Aseguraba esta semana durante un mitin en Pontevedra el Presidente del Gobierno, Mariano Rajoy, refiriéndose a la recuperación económica. Por ese motivo, parece necesario desempolvar el libro de Conocimiento del Medio para recordar las bases del ciclo del agua, al menos en la parte correspondiente a la lluvia.','2015-08-30 17:59:21','\0','Esto no es como el agua que cae del cielo, sin que se sepa exactamente por qué',173),(217,0,'Hacienda estrecha el cerco sobre las criptomonedas y exige datos a más de 60 entidades. El Fisco envía requerimientos de información de cuentas y transferencias a 16 bancos, una docena de casas de cambio y a más de 40 empresas que permiten el pago con divisas como Bitcoin. El objetivo es conocer más datos sobre origen y destino de transferencias relacionadas con cuentas bancarias de estas casas.','2018-03-23 09:35:54','\0','Hacienda estrecha el cerco sobre las criptomonedas y otras noticias económicas del día',174),(218,0,'avier Gutiérrez llegó al plató de «El Hormiguero» para hablar de su nueva película: «Campeones», una comedia con grandes dosis de ternura dirigida por Javier Fesser y que llega a los cines el 6 de abril.','2018-03-31 09:45:42','\0','Javier Gutiérrez @javiergutialva: «Los actores somos demasiado quejicas» #campeoneseh',174),(219,0,'El dispostivo de búsqueda de un hombre de 34 años y nacionalidad saudí que cayó al mar este miércoles desde un crucero que tenía prevista su escala en el puerto de Alicante continúa sin éxito veinticuatro horas después. En las tareas particpan hasta ocho mediod marítimos y aéreos de Salvamento -que recibió la voz de alarma en la que se avisaba de un hombre caído al agua la madrugada del miércoles- y dos cruceros.','2018-04-03 13:58:58','\0','Continúa sin éxito la búsqueda del turista saudí que cayó al mar desde un crucero',174);
/*!40000 ALTER TABLE `chirp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pwmktpkay2yx7v00mrwmuscl8` (`userAccount_id`),
  CONSTRAINT `FK_pwmktpkay2yx7v00mrwmuscl8` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (175,0,'jpaco9@hotmail.com','Paco','693448959','C/ falsa 123','Peña',160),(176,0,'jacintin@hotmail.com','Jacinto','688448933','C/ Lirio nº 23','Marquez',165),(177,0,'jacintin@hotmail.com','Javi','688448933','C/ Lirio nº 23','Rodriguez',166);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `modifiable` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (241,0,'\0','in box',167),(242,0,'\0','out box',167),(243,0,'\0','trash box',167),(244,0,'\0','spam box',167),(245,0,'\0','notification box',167),(246,0,'\0','in box',172),(247,0,'\0','out box',172),(248,0,'\0','trash box',172),(249,0,'\0','spam box',172),(250,0,'\0','notification box',172),(251,0,'\0','in box',173),(252,0,'\0','out box',173),(253,0,'\0','trash box',173),(254,0,'\0','spam box',173),(255,0,'\0','notification box',173),(256,0,'\0','in box',174),(257,0,'\0','out box',174),(258,0,'\0','trash box',174),(259,0,'\0','spam box',174),(260,0,'\0','notification box',174),(261,0,'\0','in box',175),(262,0,'\0','out box',175),(263,0,'\0','trash box',175),(264,0,'\0','spam box',175),(265,0,'\0','notification box',175),(266,0,'\0','in box',176),(267,0,'\0','out box',176),(268,0,'\0','trash box',176),(269,0,'\0','spam box',176),(270,0,'\0','notification box',176),(271,0,'\0','in box',177),(272,0,'\0','out box',177),(273,0,'\0','trash box',177),(274,0,'\0','spam box',177),(275,0,'\0','notification box',177),(276,0,'\0','in box',168),(277,0,'\0','out box',168),(278,0,'\0','trash box',168),(279,0,'\0','spam box',168),(280,0,'\0','notification box',168),(281,0,'\0','in box',169),(282,0,'\0','out box',169),(283,0,'\0','trash box',169),(284,0,'\0','spam box',169),(285,0,'\0','notification box',169),(286,0,'\0','in box',170),(287,0,'\0','out box',170),(288,0,'\0','trash box',170),(289,0,'\0','spam box',170),(290,0,'\0','notification box',170),(291,0,'\0','in box',171),(292,0,'\0','out box',171),(293,0,'\0','trash box',171),(294,0,'\0','spam box',171),(295,0,'\0','notification box',171);
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followup`
--

DROP TABLE IF EXISTS `followup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followup` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `publicationMoment` datetime DEFAULT NULL,
  `summary` text,
  `text` text,
  `title` varchar(255) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_publication` (`publicationMoment`),
  KEY `FK_aer0q20rslre6418yqlfwmeek` (`article_id`),
  CONSTRAINT `FK_aer0q20rslre6418yqlfwmeek` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followup`
--

LOCK TABLES `followup` WRITE;
/*!40000 ALTER TABLE `followup` DISABLE KEYS */;
INSERT INTO `followup` VALUES (236,0,'2018-04-06 10:36:54','Explico mi opinión sobre lo que dije en el artículo principal sobre los cambios temporales.','No se cómo lo hacen, pero no han sido capaces de igualar la jugabilidad de los plataformas de esta época.\n\rY aquí pienso, yo que soy anti remasters, qué hago? Un juego que tiene 20 años, es justo que se remasterice y lo disfrutemos todos? El remaster de crash lo compré por un precio que me parece más que justo, y seguro que lo haré con este. \n\rEs complicado explicar mi postura ante los remaster, pero resumiría en, si es de psx, que lo hagan. Remasters de la past gen, no.','Opinión renovada',191),(237,0,'2018-04-06 15:45:54','Vuelta a los orígenes.','Los avances de la remasterización de Dark Souls ya han empezado a aparecer, y nuestros compañeros de VG247 han publicado un vídeo del juego corriendo en una PS4 Pro.\n\rA pesar de ser uno de los remasters más esperados de esta primera mitad de 2018, el trabajo realizado no parece haber impresionado demasiado a los que lo han podido probar. \'Hasta que pude comparar el material con la versión original, no era una mejora notable. Está claro que las nuevas texturas 4K lucen genial, pero es un aseo, no una revisión total. Incluso corriendo en una PS4 Pro, no era algo impresionante\', describe Andi Hamilton, redactor del medio.\n\rJunto a sus primeras impresiones han publicado un gameplay de treinta minutos del juego que podéis ver a continuación.','Media hora de gameplay de Dark Souls Remastered en PS4 Pro',191),(238,0,'2018-04-07 13:46:54','Ha vendido 1,3M de copias en Early Access.','El sandbox de supervivencia The Long Dark llegará al cine de la mano de Jeremy Bolt, productor de la franquicia de películas Resident Evil y otras películas de Paul W.S. Anderson como Horizonte Final o su futura adaptación de Monster Hunter.\n\rRaphael van Lierop, fundador y director creativo de la desarrolladora del juego (Hinterland Studio), será el encargado del guion de la película. Asegura que su objetivo con el juego era lograr una propiedad intelectual que pudiese trasladarse a varios medios y aprovechar las peculiaridades de cada uno de ellos, así que este es el primer paso para lograr su visión del juego.\n\rEl juego sale hoy de Early Access, donde ha estado desde septiembre de 2014; también ha estado disponible en el programa Xbox Game Preview desde junio de 2015. Antes de su salida oficial ha logrado vender 1,3 millones de copias, casi doblando las 750.000 copias que había vendido a fecha de abril de este año.\n\rEl lanzamiento significará su llegada a Playstation 4. Con ella llegarán los dos primeros capítulos de Wintermute, el modo historia de The Long Dark dividido en cinco partes.\n\rThe Long Dark cuenta con un trailer con actores reales para celebrar el lanzamiento, narrado por Christopher Plummer (Up, Begginers) y escrito por el propio van Lierop.','The Long Dark tendrá adaptación al cine a cargo del productor de las películas de Resident Evil',193),(239,0,'2018-04-08 15:33:54','Llegará con campaña y versión de PS4.','Hinterland Studio ha anunciado que la versión 1.0 de The Long Dark saldrá el 1 de agosto.\n\rCon esta versión llegarán los dos primeros capítulos (seis-diez horas de gameplay, según sus responsables) de una campaña episódica llamada Wintermute. Esta primera temporada se alargará hasta principios de 2018. El modo historia aprovechará el gélido y peligroso entorno nevado donde transcurre el sandbox de supervivencia para contar las historias de varios personajes.\n\rThe Long Dark saldrá de Early Access tanto en PC como en Xbox One el 1 de agosto y aprovechando la ocasión se lanzará para Playstation 4.','The Long Dark saldrá de Early Access el 1 de agosto',193),(240,0,'2018-04-02 17:12:54','Movimiento Contra la Intolerancia ha interpuesto una denuncia en la Fiscalía de Delitos de Odio de Sevilla por este acto celebrado el Domingo de Resurrección','El Movimiento Contra la Intolerancia ha interpuesto una denuncia en la Fiscalía de Delitos de Odio de Sevilla por el «linchamiento de una muñeca, hecha de tela y de paja, que representaba a una mujer negra, con peluca rizada, significando a Ana Julia (Quezada), la asesina confesa del niño Gabriel».\n\rEstos hechos se produjeron el pasado Domingo de Resurrección en Coripe, durante la celebración de la tradicional «Quema de Judas». En esta fiesta, los vecinos de Coripe disparan con balas de fogueo, apalean y, finalmente, queman a un muñeco de trapo, caracterizado como la peor persona del año. En 2017, la «víctima» fue Bárbara Rey.\n\rLa denuncia pide la retirada de varios vídeos publicados en redes sociales y portales de internet, por los gritos racistas y de odio vertidos por los asistentes, entre los que se encontraban menores. «¡A tomar por c… la negra, con sus mu…! ¡No la matan en España, pues la matamos en Coripe!» o «¡Ni Puigdemont ni mier…, la negra!» son algunas de las frases que pueden escucharse en algunos de los vídeos que circulan por internet','Coripe «lincha» a una muñeca de la asesina confesa del pequeño Gabriel durante la «Quema de Judas»',198);
/*!40000 ALTER TABLE `followup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followup_pictures`
--

DROP TABLE IF EXISTS `followup_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followup_pictures` (
  `FollowUp_id` int(11) NOT NULL,
  `pictures` text,
  KEY `FK_be66suxjlinls1y3yymi3tc0d` (`FollowUp_id`),
  CONSTRAINT `FK_be66suxjlinls1y3yymi3tc0d` FOREIGN KEY (`FollowUp_id`) REFERENCES `followup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followup_pictures`
--

LOCK TABLES `followup_pictures` WRITE;
/*!40000 ALTER TABLE `followup_pictures` DISABLE KEYS */;
/*!40000 ALTER TABLE `followup_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesage`
--

DROP TABLE IF EXISTS `mesage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesage` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `folder_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a5oo9jyvvg4wrc8esqpvtramk` (`folder_id`),
  CONSTRAINT `FK_a5oo9jyvvg4wrc8esqpvtramk` FOREIGN KEY (`folder_id`) REFERENCES `folder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesage`
--

LOCK TABLES `mesage` WRITE;
/*!40000 ALTER TABLE `mesage` DISABLE KEYS */;
INSERT INTO `mesage` VALUES (296,0,'http://advertisement1.com','2018-04-08 15:33:54','LOW','false',241,168,172);
/*!40000 ALTER TABLE `mesage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper`
--

DROP TABLE IF EXISTS `newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `deprived` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `publicationDate` datetime DEFAULT NULL,
  `tabooWord` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_deprived` (`deprived`),
  KEY `index_publication` (`publicationDate`),
  KEY `index_title` (`title`),
  KEY `index_taboo` (`tabooWord`),
  KEY `index_description` (`description`),
  KEY `FK_1vjxhvxnpuoan0f5uyrs4veeg` (`user_id`),
  CONSTRAINT `FK_1vjxhvxnpuoan0f5uyrs4veeg` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper`
--

LOCK TABLES `newspaper` WRITE;
/*!40000 ALTER TABLE `newspaper` DISABLE KEYS */;
INSERT INTO `newspaper` VALUES (181,0,'\0','Eurogamer es la página independiente sobre videojuegos más grande de Europa, con noticias, análisis, avances y mucho más.','https://cdn.gamer-network.net/2018/eg12/EG-Logo-es.png/EG11/resize/-1x92/format/png/logo.png?v20180405120811','2018-04-03 00:00:00','\0','Eurogamer SPAIN',172),(182,0,'','Eurogamer es la página independiente sobre videojuegos más grande de Europa, con noticias, análisis, avances y mucho más.','https://cdn.gamer-network.net/2018/eg12/EG-Logo-es.png/EG11/resize/-1x92/format/png/logo.png?v20180405120811','2018-04-04 00:00:00','\0','Eurogamer SPAIN',172),(183,0,'\0','Eurogamer es la página independiente sobre videojuegos más grande de Europa, con noticias, análisis, avances y mucho más.','https://cdn.gamer-network.net/2018/eg12/EG-Logo-es.png/EG11/resize/-1x92/format/png/logo.png?v20180405120811','2018-04-03 00:00:00','\0','Eurogamer SPAIN',172),(184,0,'\0','El gran periódico español. Diario de referencia y decano de la prensa nacional. Líder en dispositivos móviles. Credibilidad e información al instante.','http://www.abc.es/2015/img/abc.png','2018-04-05 00:00:00','\0','ABC',173),(185,0,'','El gran periódico español. Diario de referencia y decano de la prensa nacional. Líder en dispositivos móviles. Credibilidad e información al instante.','http://www.abc.es/2015/img/abc.png','2018-04-04 00:00:00','\0','ABC',173),(186,0,'\0','El gran periódico español. Diario de referencia y decano de la prensa nacional. Líder en dispositivos móviles. Credibilidad e información al instante.','http://www.abc.es/2015/img/abc.png','2018-04-03 00:00:00','\0','ABC',173),(187,0,'\0','Diario de información general y local más leído de España, consulta las noticias de última hora de España, internacional, local, deportes en 20minutos. Cialis.','https://yt3.ggpht.com/a-/AJLlDp1BN3DCWrOPTMnRAIrAHtYChahB-kJvdqhGnA=s900-mo-c-c0xffffffff-rj-k-no','2018-05-01 00:00:00','\0','20 Minutos',174),(188,0,'\0','Marca es un diario español de información deportiva, con sede en Madrid, con una tirada media de 413 252 ejemplares diarios y un promedio de difusión de 287 641 ejemplares (OJD).?','https://elcorreodesalvadorcortes.files.wordpress.com/2012/11/marca_com.jpg',NULL,'\0','Marca',174),(189,0,'\0','El diario As es una publicación deportiva española de tirada diaria, de pago y con distribución matinal editado por el Grupo PRISA.','https://upload.wikimedia.org/wikipedia/commons/5/51/Logo_diario_AS.svg','2018-04-07 00:00:00','\0','AS',172),(190,0,'\0','Diario deportivo online, aquí encontraras toda la información de tu deporte favorito,fútbol, motociclismo,formula 1,fichajes,partidos en directo y mucho más','https://upload.wikimedia.org/wikipedia/commons/5/51/Logo_diario_AS.svg','2018-04-09 00:00:00','\0','AS',172);
/*!40000 ALTER TABLE `newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper_volume`
--

DROP TABLE IF EXISTS `newspaper_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper_volume` (
  `newspapers_id` int(11) NOT NULL,
  `volumes_id` int(11) NOT NULL,
  KEY `FK_5xgq4fnlvel48cuqlnmvr7gi0` (`volumes_id`),
  KEY `FK_7ejgw9advhl067n11hyumg358` (`newspapers_id`),
  CONSTRAINT `FK_7ejgw9advhl067n11hyumg358` FOREIGN KEY (`newspapers_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_5xgq4fnlvel48cuqlnmvr7gi0` FOREIGN KEY (`volumes_id`) REFERENCES `volume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper_volume`
--

LOCK TABLES `newspaper_volume` WRITE;
/*!40000 ALTER TABLE `newspaper_volume` DISABLE KEYS */;
INSERT INTO `newspaper_volume` VALUES (181,178),(183,178),(184,179),(184,180),(186,179),(187,180);
/*!40000 ALTER TABLE `newspaper_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `CVV` int(11) NOT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `expirationMonth` int(11) NOT NULL,
  `expirationYear` int(11) NOT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `newspaper_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5vr59convu3n65h1o380uan1o` (`newspaper_id`,`customer_id`),
  KEY `FK_hqs9hx1271rvngqhmap9g83sb` (`customer_id`),
  CONSTRAINT `FK_9gf3f76p2buehst61krec0f5i` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_hqs9hx1271rvngqhmap9g83sb` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe`
--

LOCK TABLES `subscribe` WRITE;
/*!40000 ALTER TABLE `subscribe` DISABLE KEYS */;
INSERT INTO `subscribe` VALUES (225,0,450,'VISA',2,2020,'Phaidros Randi','4000990618525905',175,181),(226,0,450,'VISA',2,2020,'Phaidros Randi','4000990618525905',175,184),(227,0,450,'VISA',2,2020,'Phaidros Randi','4000990618525905',175,182),(228,0,450,'VISA',2,2020,'Phaidros Randi','4000990618525905',175,183),(229,0,450,'VISA',2,2020,'Phaidros Randi','4000990618525905',175,185),(230,0,450,'VISA',2,2020,'Phaidros Randi','4000990618525905',175,186),(231,0,389,'MASTERCARD',3,2021,'Randy Gordon','5830174670847761',176,186),(232,0,389,'MASTERCARD',3,2021,'Randy Gordon','5830174670847761',176,183),(233,0,389,'MASTERCARD',3,2021,'Randy Gordon','5830174670847761',176,181),(234,0,389,'MASTERCARD',3,2021,'Randy Gordon','5830174670847761',176,182),(235,0,389,'MASTERCARD',3,2021,'Randy Gordon','5830174670847761',176,185);
/*!40000 ALTER TABLE `subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribevol`
--

DROP TABLE IF EXISTS `subscribevol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscribevol` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `CVV` int(11) NOT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `expirationMonth` int(11) NOT NULL,
  `expirationYear` int(11) NOT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `volume_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fguwhnbvmh62m0siij8dvx7vg` (`volume_id`,`customer_id`),
  KEY `FK_j3fdo29o4qu6s0m4dnj6rrx9k` (`customer_id`),
  CONSTRAINT `FK_fmlj7xxei7kfll9d9x6as7wq6` FOREIGN KEY (`volume_id`) REFERENCES `volume` (`id`),
  CONSTRAINT `FK_j3fdo29o4qu6s0m4dnj6rrx9k` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribevol`
--

LOCK TABLES `subscribevol` WRITE;
/*!40000 ALTER TABLE `subscribevol` DISABLE KEYS */;
INSERT INTO `subscribevol` VALUES (220,0,450,'VISA',2,2020,'Phaidros Randi','4000990618525905',175,178),(221,0,450,'VISA',2,2020,'Phaidros Randi','4000990618525905',175,179),(222,0,450,'VISA',2,2020,'Phaidros Randi','4000990618525905',175,180),(223,0,389,'MASTERCARD',3,2021,'Randy Gordon','5830174670847761',176,178),(224,0,389,'MASTERCARD',3,2021,'Randy Gordon','5830174670847761',176,179);
/*!40000 ALTER TABLE `subscribevol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taboo`
--

DROP TABLE IF EXISTS `taboo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taboo` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taboo`
--

LOCK TABLES `taboo` WRITE;
/*!40000 ALTER TABLE `taboo` DISABLE KEYS */;
INSERT INTO `taboo` VALUES (152,0,'sex'),(153,0,'sexo'),(154,0,'cialis'),(155,0,'viagra');
/*!40000 ALTER TABLE `taboo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `postalAddress` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o6s94d43co03sx067ili5760c` (`userAccount_id`),
  CONSTRAINT `FK_o6s94d43co03sx067ili5760c` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (172,0,'pupillydab-1116@yopmail.com','Allen','799901185','4715 Brannon Street','R. Chilson',157),(173,0,'pzesaffatimm-4901@yopmail.com','Chioma','209738334','386 Washington Avenue','Steaphan Marinus',158),(174,0,'pirennyta-6370@yopmail.com','Ferid','802590193','2353 Elk Street','Ulrich Kostyantyn',159);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user` (
  `followers_id` int(11) NOT NULL,
  `follows_id` int(11) NOT NULL,
  KEY `FK_p9wcdbf2yc1blf0qgv5tm4ji6` (`follows_id`),
  KEY `FK_ipxcfus1p41qgn9xbfhg2aa0r` (`followers_id`),
  CONSTRAINT `FK_ipxcfus1p41qgn9xbfhg2aa0r` FOREIGN KEY (`followers_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_p9wcdbf2yc1blf0qgv5tm4ji6` FOREIGN KEY (`follows_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (172,173),(172,174),(173,172),(174,172),(174,173);
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (156,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(157,0,'24c9e15e52afc47c225b757e7bee1f9d','user1'),(158,0,'7e58d63b60197ceb55a1c487989a3720','user2'),(159,0,'92877af70a45fd6a2ed7fe81e1236b78','user3'),(160,0,'ffbc4675f864e0e9aab8bdf7a0437010','customer1'),(161,0,'83a87fd756ab57199c0bb6d5e11168cb','agent1'),(162,0,'b1a4a6b01cc297d4677c4ca6656e14d7','agent2'),(163,0,'6f097a447415dd5030d579a9051165f0','agent3'),(164,0,'0d7745d57a8ae3fcacdd9fe6e54cac8a','agent4'),(165,0,'5ce4d191fd14ac85a1469fb8c29b7a7b','customer2'),(166,0,'033f7f6121501ae98285ad77f216d5e7','customer3');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (156,'ADMIN'),(157,'USER'),(158,'USER'),(159,'USER'),(160,'CUSTOMER'),(161,'AGENT'),(162,'AGENT'),(163,'AGENT'),(164,'AGENT'),(165,'CUSTOMER'),(166,'CUSTOMER');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume`
--

DROP TABLE IF EXISTS `volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volume` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1g852qpv1irbrshl0rmqgfm3a` (`user_id`),
  CONSTRAINT `FK_1g852qpv1irbrshl0rmqgfm3a` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume`
--

LOCK TABLES `volume` WRITE;
/*!40000 ALTER TABLE `volume` DISABLE KEYS */;
INSERT INTO `volume` VALUES (178,0,'Lista de periódicos personalizada por el user 1','Lista personalizada 1',2018,172),(179,0,'Lista de periódicos personalizada por el user2','Lista personalizada 2',2018,173),(180,0,'Lista de periódicos personalizada por el user3','Lista personalizada user2',2019,174);
/*!40000 ALTER TABLE `volume` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-03 16:46:18
COMMIT;
