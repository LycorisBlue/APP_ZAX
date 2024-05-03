import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hatooh/main.dart';

class ConditionsGeneralesVentePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height,
    );
    return Scaffold(
      backgroundColor: gris_clair,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            Text(
              'CONDITIONS GÉNÉRALES DE VENTE',
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: orange,
              ),
            ),
            SizedBox(height: 25),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Conditions générales de vente (CGV) du site HATOOH-CI.COM et des applications HATOOH',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              '1 - Objet',
              style: GoogleFonts.roboto(
                fontSize: 22,
                color: gris_pur,
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Les présentes « Conditions Générales de Vente (CGV) » ont pour objet l\'encadrement juridique spécifique des prestations de services et des offres disponibles sur le site HATOOH-CI.COM et sur les applications HATOOH. Elles s\'adressent à :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Toute personne physique ou morale souhaitant accéder aux prestations de services et offres disponibles sur le site HATOOH-CI.COM et sur les applications HATOOH, ci-après appelée « Le Client ».',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Toute personne physique ou morale fournissant des prestations de services et des offres sur le site HATOOH-CI.COM et sur les applications HATOOH , ci-après appelée « Le Partenaire ou Le Prestataire de services » Les Conditions Générales de Vente doivent être acceptées par tous ; l\'accès aux services et offres disponibles sur le site est conditionné par une acceptation expresse préalable de ces conditions.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              '2 - Nos Services',
              style: GoogleFonts.roboto(
                fontSize: 22,
                color: gris_pur,
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Le site HATOOH-CI.COM est le site officiel de la société HATOOH spécialisée dans la promotion de la destination Côte d\'Ivoire, société à responsabilité limitée (SARL), immatriculée au RCCM en Côte d\'Ivoire, dont le siège social est situé à Grand-Bassam, 18 BP 1563 ABIDJAN 18.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Nous offrons aux usagers et aux entreprises des plateformes sécurisées et adaptées à leurs besoins. Nous portons à leur connaissance les meilleurs offres d\'hébergement, de location de voitures, de transfert aéroport, de location de bateaux, d\'attractions, d\'affrètement d\'avion privé, et biens d\'autres. Nous permettons aux clients de réserver en toute sérénité et en toute simplicité, toute la chaîne de voyage depuis l\'hébergement, la voiture de location, une attraction (circuits touristiques, brunch, événements, même pour des colonies de vacances), un guide touristique, un interprète, une navette aéroportuaire et même faire affréter un avion privé.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              '3 - Nos Tarifs',
              style: GoogleFonts.roboto(
                fontSize: 22,
                color: gris_pur,
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Les tarifs des différents services disponibles sur notre site sont des tarifs fixés librement par nos partenaires à savoir les hôtels, les hébergements, les agences de location de voitures, les guides touristiques, les interprètes, les propriétaires de bateaux de plaisance, les promoteurs de spectacles, les compagnies de location et d\'affrètement d\'avions et hélicoptères privés, etc.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Ces tarifs sont des tarifs homologués pour le bien-être de nos clients. Ils sont fixés en Francs CFA, en Dollar et en Euro. En outre, en vertu des rapports de partenariat existant entre notre site et les partenaires, 10% desdits tarifs seront reversés au Site à compter de chaque réservation ou paiement.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'En dehors des tarifs fixés par nos partenaires, des frais et des taxes supplémentaires devront être payés par le client en fonction des services demandés. Il convient donc de préciser que les erreurs évidentes et les fautes d\'impression sur notre Site ne sont pas contraignantes.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                '4 - Les Réservations sur notre site et nos applications',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Pour bénéficier des différents services disponibles sur le site HATOOH-CI.COM et les applications HATOOH, tout client doit préalablement effectuer une ou des réservations. À cet effet, le client doit créer son compte d\'utilisateur sur le site HATOOH-CI.COM ou sur les applications HATOOH avec un e-mail valide et un mot de passe sécurisé.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Les réservations diffèrent d\'un service à un autre. Cependant, grâce aux plateformes de réservation disponible sur le site HATOOH-CI.COM et aux applications téléchargeables sur App Store et Google Play Store, les réservations sur note site sont simples, sécurisées et rapides.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                '4.1 - Les réservations pour l\'affrètement d\'avions privés',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Les réservations pour l\'affrètement d\'avions privés sur notre site HATOOH-CI.COM et sur les applications HATOOH doivent s\'effectuer selon les règles suivantes :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Lorsque vous effectuez une réservation, vous acceptez les conditions applicables telles qu\'elles sont affichées dans le processus de réservation. Les conditions d\'annulation de chaque partenaire ou prestataire de service et toutes les autres conditions (concernant les conditions d\'âge, les cautions/dépôts de garantie, les suppléments pour les réservations de groupe, les lits supplémentaires, le petit-déjeuner, les animaux domestiques, les cartes acceptées, etc.) sont accessibles sur nos Plateformes pendant le processus de réservation ainsi que dans les clauses et/ou dans l\'e-mail de confirmation ou sur le contrat d\'affrètement (le cas échéant).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Chaque réservation que vous effectuez est directement passée auprès de la compagnie dont nous sommes le représentant commercial en Côte d\'Ivoire. Nous ne sommes pas une « partie contractuelle » à votre réservation. Lorsque vous réservez, vous concluez un contrat d\'affrètement directement avec la compagnie aérienne partenaire.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '3 - Ce contrat est censé indiquer tous les éléments du vol, le nombre de passagers autorisés, les prestations incluses, le poids des bagages ainsi que tous les détails du vol ; celui-ci doit en outre, comporter les articles sur les responsabilités de chaque partie, les conditions générales et les assurances. Nous ne serons pas partie à ce contrat. ',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '4 - Nous agissons uniquement en tant qu\'éditeur du site et des applications et ne sommes pas impliqués dans les Conditions de tiers. Nous ne sommes pas responsables des conditions de votre affrètement et nous n\'avons aucune responsabilité envers vous en ce qui concerne votre réservation. À travers notre plateforme nous vous mettons uniquement en relation avec des prestataires de services (nos partenaires) qui sont chargés de la promotion et de la vente de leurs expériences voyage.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '5 - Une fois votre affrètement réservé, les détails de votre réservation (par exemple les noms du ou des voyageur(s)) seront transmis au prestataire de services. Selon le contrat d\'affrètement, nous pourrons vous aider à modifier ou annuler votre réservation si vous le souhaitez.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '6 - Lorsque vous réservez un affrètement, votre paiement est organisé par le département VIP de HATOOH-CI.COM ou par une compagnie aérienne partenaire.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '7 - Les compagnies aériennes se réservent le droit de reporter ou d\'annuler des affrètements dans les conditions prévues dans leurs contrats d\'affrètement.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '8 - Si vous annulez une réservation ou ne vous présentez pas, les frais d\'annulation/de non présentation et tout remboursement dépendront des conditions d\'annulation/de non présentation du prestataire de services.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '9 - Toutefois, certaines réservations ne peuvent pas être annulées gratuitement, tandis que d\'autres ne peuvent être annulées gratuitement trois (3) jours avant la date du vol.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '10 - Des frais peuvent s\'appliquer en cas de changement ou d\'annulation de votre vol.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '11 - Si vous pensez avoir un empêchement, veuillez contacter votre prestataire de services et lui indiquer votre heure d\'arrivée, afin qu\'il n\'annule pas votre réservation. Si vous êtes en retard, nous ne sommes pas responsables des conséquences qui en découlent (par exemple l\'annulation de votre réservation ou les frais que le prestataire de service peut facturer).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '12 - En tant que personne effectuant la réservation, vous êtes responsable des actions et du comportement de chaque membre du groupe. Vous êtes également tenu(e) d\'obtenir leur autorisation avant de nous fournir leurs données personnelles.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                '4.2 - Les réservations pour les navettes aéroportuaires',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'En vue de faciliter la tâche aux voyageurs, nous mettons à disposition des voyageurs des navettes aéroportuaires. Ces navettes sont proposées par nos partenaires (prestataires de services). Ainsi les réservations pour les navettes aéroportuaires sur le site HATOOH-CI.COM et sur les applications HATOOH doivent être réalisées suivant ces consignes :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Avant toute réservation, veuillez lire et accepter les Conditions Générales de Vente du site HATOOH-CI.COM et les conditions et offres de navettes aéroportuaires postées par le restataire de services.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Lorsque vous réservez une navette aéroportuaire, votre réservation est directement effectuée auprès du prestataire de service. Celui-ci se charge de vous mettre dans les meilleurs conditions.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '3 - Lorsque la navette aéroportuaire est défaillante, vous pouvez nous le signaler à temps afin que nous vous proposons un autre service avant la fin de votre séjour.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '4 - Afin d\'être rassuré sur la qualité de la navette aéroportuaire choisie, n\'hésitez pas à consulter les avis et recommandations disponibles sur notre site.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '5 - Une fois votre réservation effectuée, nous transmettrons vos informations (telles que votre nom, votre numéro de téléphone et le lieu de la prise en charge) au prestataire de services.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '6 - En effectuant une réservation, vous confirmez que vous avez lu et accepté les conditions du prestataire de services ; acceptez de contacter préalablement le prestataire de services en cas de problème ; comprenez que le prestataire de services est tenu d\'organiser votre transport privé dès la sortie de l\'aéroport, vos courses, d\'établir les tarifs et de fournir toutes les informations pertinentes.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '7 - Vous acceptez que nous vous offrons uniquement des plateformes de réservation et que nous ne serons en aucun cas responsable de toute perte occasionnée en raison d\'une action ou d\'une omission du Prestataire de services.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                '4.3 - Les réservations pour l\'hébergement',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Nous mettons également à votre disposition une plateforme sur laquelle les prestataires de services peuvent promouvoir et vendre leurs hébergements et vous pouvez les rechercher, les comparer et les réserver, en suivant les consignes ci-après :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Renseignez correctement toutes vos coordonnées afin que HATOOH-CI.COM et/ou le prestataire de services puissent vous fournir des informations sur votre réservation et, si nécessaire, vous contacter.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Lisez attentivement ces conditions et celles affichées pendant le processus de réservation.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '3 - Une fois que vous aurez réservé votre hébergement, nous vous fournirons, ainsi qu\'au prestataire de services, les détails de votre réservation, y compris les noms du ou des client(s).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '4 - Prenez soin de l\'hébergement ainsi que des meubles, des équipements, des appareils électroniques et autres éléments, et laissez les lieux dans le même état que celui dans lequel vous les avez trouvés en arrivant. Si un objet est cassé, endommagé ou perdu, assurez-vous de le signaler au personnel sur place (dès que vous le pouvez, et surtout avant votre départ).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '5 - Préservez la sécurité de l\'hébergement et de son mobilier durant votre séjour. Pour ce faire, ne laissez pas, par exemple, les portes ou les fenêtres déverrouillées.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '6 - Lorsque vous effectuez une réservation, vous pouvez voir que certains prestataires de services font référence à des « conditions relatives au dépôt de garantie ». Cela signifie que si un membre de votre groupe perd ou endommage quoi que ce soit : vous devez informer le prestataire de services ; au lieu de vous le facturer directement, le prestataire de services disposera d\'un délai de quinze (15) jours pour soumettre une demande de dommages et intérêts via notre plateforme, sous votre numéro de réservation ; nous vous indiquerons s\'il soumet une telle demande afin que vous puissiez nous dire si vous avez des commentaires et si vous êtes d\'accord ou non avec les frais - puis: si vous êtes d\'accord, nous vous facturerons en son nom ; si vous n\'êtes pas daccord, nous étudierons la question et déciderons d\'en discuter davantage ou non.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '7 - Le montant maximum que le prestataire de services peut vous facturer via notre plateforme en vertu des conditions relatives au dépôt de garantie est indiqué au moment de votre réservation.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '8 - Tout paiement que vous effectuez sur notre site sera automatiquement reversé au prestataire de services.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '9 - Selon les conditions de votre réservation, nous pourrons vous aider à la modifier ou l\'annuler si vous le souhaitez. Cependant la demande de modification ou d\'annulation doit intervenir au plus tard un (1) jour après le début de l\'hébergement.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                '4.4 - Les réservations pour les locations de voitures ou de bateaux',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Toujours dans le but de vous assurer le confort nécessaire, nous mettons à votre disposition des services de locations de voitures, de bateaux et d\'autres engins. La location de ces engins est conditionnée à une réservation qui doit obéir aux règles suivantes :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Lorsque vous réservez une location, votre réservation est effectuée auprès de nous ; nos conditions régissent le processus de réservation. Toutefois lorsque votre réservation est confirmée, vous concluez automatiquement un contrat avec le prestataire de services. Ce contrat de location vous lie uniquement au prestataire de services. Nous sommes tiers à ce contrat. Seul le prestataire de services engage sa responsabilité vis-à-vis de vous en cas de non-respect des clauses de la location.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Dans la plupart des cas, vous recevrez votre confirmation de réservation dès que vous aurez finalisé votre réservation. Toutefois, si le prestataire de services ne confirme pas votre location immédiatement, nous ne vous débiterons pas et ne vous enverrons pas votre confirmation de réservation tant que nous n\'aurons pas reçu sa confirmation.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '3 - Nous ne garantissons pas que vous obtiendrez la marque et le modèle précis que vous avez réservés (sauf si nous l\'indiquons expressément). L\'expression « ou équivalent » signifie que vous pourriez obtenir une voiture ou un bateau (c\'est-à dire de la même taille, avec les mêmes caractéristiques).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '4 - Les photos de voitures, bateaux ne sont fournies qu\'à titre d\'illustration.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '5 - Une fois que vous avez réservé votre location : nous donnerons au prestataire de services les détails de la réservation (par exemple le nom et le numéro de téléphone du conducteur principal) ; nous vous fournirons des informations sur la prise en charge (par exemple les coordonnées du prestataire de services et les détails de l\'offre).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '6 - Vous devez fournir toutes les informations dont nous avons besoin pour organiser votre réservation (coordonnées, heure de prise en charge, etc.). Vous devez également vérifier les exigences spécifiques de votre location, car de nombreux détails (exigences relatives au permis de conduire, montant du dépôt de garantie, documents nécessaires, cartes de paiement acceptées, etc.) varient selon la location.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '7 - Vous devez lire les présentes conditions et le contrat de location et accepter de vous y conformer. Vous devez également reconnaître qu\'en cas de violation de ceux-ci, vous êtes susceptible de payer des frais supplémentaires ; votre réservation peut être annulée ; le personnel de l\'agence de location peut refuser de vous remettre les clés.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '8 - Vous devez vous présenter au guichet de l\agence de location à l\'heure de prise en charge : si vous êtes en retard, la voiture ou le bateau peut ne plus être disponible et vous n\'aurez droit à aucun remboursement. Si vous pensez que vous risquez d\'être en retard, vous devez impérativement contacter le prestataire de services ou HATOOH-CI.COM, même si un retard de vol en est la cause et que vous avez fourni votre numéro de vol.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '9 - Vous devez être en possession de tous les documents (tels qu\'une pièce d\'identité, un bon et un permis de conduire) dont vous avez besoin lors de la prise en charge. Vous devez aussi présenter à l\'agence de location le permis de conduire complet et valide de chaque conducteur, détenu depuis au moins 1 an (ou plus, dans de nombreux cas). Si un conducteur a des mentions/points sur son permis, veuillez nous en informer dès que possible, car le prestataire de service pourrait ne pas l\'autoriser à conduire.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                '4.5 - Les réservations pour les attractions',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: orange,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Dans le but de promouvoir la destination Côte d\'Ivoire, nous proposons également des offres d\'attractions. Ces offres appartiennent à diverses sociétés partenaires ainsi qu\'à des particuliers spécialisés dans le tourisme. Pour bénéficier de ces offres, vous pouvez faire vos réservations sur notre site et suivant ces règles :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Vous devez remplir correctement toutes vos coordonnées afin que HATOOH-CI.COM et/ou le prestataire de services puissent vous fournir des informations sur votre réservation et, si nécessaire, vous contacter.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Vous devez lire nos conditions et les conditions de nos partenaires (qui seront affichées au moment du paiement) et accepter de vous y conformer. Vous devez également reconnaître que leur violation peut entraîner des frais supplémentaires et/ou l\'annulation de votre réservation.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '3 - Nous vous fournissons uniquement des plateformes de réservation et ne sommes pas impliqués dans les conditions de nos partenaires. Nous ne sommes pas responsables de votre billet et (dans toute la mesure permise par la loi) n\'avons aucune responsabilité envers vous en ce qui concerne l\'attraction réservée. Nous fournissons des plateformes sur lesquelles les prestataires de services (de temps à autre) peuvent promouvoir et vendre des expériences touristiques.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '4 - Vous pouvez les rechercher, les comparer et les réserver .',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '5 - Une fois vous réservez pour une expérience, une attraction, nous vous fournirons, ainsi qu\'au prestataire de services, les détails de la réservation. Si le prestataire de services a besoin d\'autres informations que votre nom, nous vous en informerons au moment de la réservation.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '6 - Selon les conditions de votre réservation, nous pourrons vous aider à la modifier ou l\'annuler si vous le souhaitez.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              '5 - Paiement',
              style: GoogleFonts.roboto(
                fontSize: 22,
                color: gris_pur,
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'En tant qu\'un site et applications spécialisés dans la réservation de services d\'affrètement d\'avions privés, de navettes aéroportuaires, de location de voitures, de location de bateaux, d\'hébergements, nous vous proposons des mécanismes simplifiés et sécurisés de paiement en ligne et à distance.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Ainsi, vous pouvez payer une partie ou la totalité du prix du service choisi dès la réservation. Vous avez le choix entre les moyens de paiement suivants :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Paiement par mobile money (ORANGE MONEY, MOOV MONEY, MTN MONEY, WAVE).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Paiement par carte bancaire ou carte de crédit (VISA, PayPal, etc.).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Une fois que vous effectuez un paiement, nous nous chargeons de transférer les fonds versés et vos coordonnées au prestataire de services.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Lorsque le prestataire de services exige un paiement initial, celui-ci peut être prélevé ou préautorisé lorsque vous effectuez votre réservation, et il peut être non remboursable. Par conséquent, avant de réserver, veuillez vérifier les conditions de paiement initial du prestataire de services (accessible pendant le processus de réservation), sur laquelle nous n\'avons aucune influence et dont nous ne sommes pas responsables.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Si vous avez connaissance d\'une fraude ou d\'une utilisation non autorisée de votre moyen de paiement ou soupçonnez de tels comportements, veuillez contacter votre fournisseur de paiement, qui peut couvrir les frais en résultant, parfois en déduisant une franchise.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Nous conserverons les détails de votre moyen de paiement pour les transactions futures après avoir recueilli votre consentement.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '6 - Annulations, modifications et remboursements',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Nous ne nous limitons pas à nos obligations légales. Même si nous ne sommes pas tenus de proposer des droits d\'annulation spécifiques, nous vous offrons la possibilité de bénéficier de nos modalités de remboursement si vous remplissez nos conditions d\'annulation, sauf contrainte particulière.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Sur le site HATOOH-CI.COM et les applications HATOOH, tout client a la possibilité d\'annuler une ou plusieurs réservations. Cependant, toute annulation est soumise aux conditions suivantes :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Le client doit formuler une demande d\'annulation auprès du responsable du site.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- La demande d\'annulation doit intervenir trois (3) jours avant la date de réalisation du service.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- La réservation ne doit pas porter la mention « non remboursable » (vous ne pouvez pas modifier une réservation non remboursable et vous ne recevrez aucun remboursement si vous l\'annulez).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Lorsque votre demande d\'annulation a été réalisée selon les conditions exigées, vous recevrez un remboursement intégral. Ce remboursement prend en compte uniquement le prix du service choisi. Les frais et les taxes éventuels ne sont pas remboursables.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Vous pouvez aussi modifier votre réservation à tout moment avant la date fixée pour la relation du service choisi sur notre site ou nos applications. La plupart du temps, le plus simple est d\'effectuer ces changements depuis notre application ou notre site internet (section « Gérer la réservation »).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Aucun frais de gestion ne s\'appliquent si vous modifiez votre réservation, mais tout changement effectué peut affecter le tarif du service ou de l\'offre. Parfois, pour modifier une réservation, nous n\'avons d\'autre choix que de l\'annuler et d\'en créer une autre. Dans ce cas, nous pourrons être amenés à vous facturer des frais d\'annulation au nom du Prestataire de services.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Si la modification de votre réservation entraîne un changement du prix du service ou génère des frais d\'annulation, nous vous en informerons à l\'avance. Pour toute question concernant des changements, des annulations ou des remboursements, veuillez contacter notre service client.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '7 - Limitation de responsabilité',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Conformément aux législations en vigueur notamment la loi ivoirienne en matière de protection des consommateurs, nous serons uniquement responsables des dommages ou frais que vous encourrez en conséquence directe d\'un manquement de notre part. Cela signifie que, nous ne serons pas responsable (à titre d\'exemple) des éléments suivants :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Perte indirecte ou dommage indirect.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Informations inexactes sur un prestataire de services, produit, service ou action d\'un prestataire de services ou d\'un autre partenaire.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Erreur dans une adresse e-mail, un numéro de téléphone ou un numéro de carte de crédit (sauf si nous en sommes à l\'origine).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Force majeure ou événement indépendant de notre volonté.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Si vous enfreignez les présentes conditions et/ou les conditions du prestataire de services, dans les limites de la loi, nous ne serons pas responsables des dommages ou frais que vous encourez en conséquence, et vous n\'aurez droit à aucun remboursement.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Dans la mesure permise par la loi, le maximum dont HATOOH sera responsable est le manquement aux obligations de confidentialité et de respect de vos réservations. Quant au prestataire de services, il sera responsable (que ce soit pour un événement ou une série d\'événements liés) des manquements à ses obligations de délivrance, de livraison et de conformité.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '8 - Que faire en cas de problème ?',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Pour répondre convenablement à toutes vos attentes, le site web HATOOH-CI.COM et les applications HATOOH reçoit vos questions et réclamations. Ainsi :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '1 - Si vous avez une question ou une réclamation, veuillez contacter notre service client. Vous pouvez le faire en accédant à votre réservation, par le biais de nos applications ou via notre centre d\'aide, ou vous pourrez également trouver des FAQ utiles. Vous pouvez nous aider à intervenir dans les plus brefs délais en fournissant : le numéro de réservation, vos coordonnées, votre code confidentiel (si vous en avez un) et l\'adresse e-mail que vous avez utilisée au moment d\'effectuer votre réservation ; un résumé du problème, indiquant en quoi nous pouvons vous aider ; tout document justificatif (relevé bancaire, photos, reçus, etc.).',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '2 - Toutes les demandes et les réclamations sont enregistrées et les plus urgentes sont traitées en priorité.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '3 - Nous nous efforçons de résoudre les litiges en interne dans un délai de deux (2) mois. En cas de non-règlement du litige en interne, vous pouvez saisir les autorités étatiques compétentes. Toutefois la voie du règlement amiable est à privilégier.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '4 - Nous pouvons vous aider à communiquer avec votre prestataire de services, mais nous ne pouvons garantir qu\'il lira les informations que vous lui transmettez, ou qu\'il fera ce que vous lui demandez. Le simple fait que vous le contactiez, ou qu\'il vous contacte, ne signifie pas que vos raisons d\'intenter une action en justice sont légitimes.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '9 - Mesures contre les comportements inacceptables',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'En tant que responsable de notre site, nous ne pouvons tolérer certains comportements inacceptables. Dès lors des mesures draconiennes seront pris en réponse à certains comportements abusifs et illégitimes.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Ainsi, nous avons le droit de vous empêcher d\'effectuer des réservations, d\'annuler toute réservation que vous avez déjà effectuée et/ou de vous empêcher d\'utiliser nos plateformes, notre service client et/ou votre compte. Bien sûr, nous ne le ferons que si nous estimons qu\'il y a une bonne raison de le faire, comme dans les cas suivants :',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Fraude ou abus.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Non-respect de nos valeurs, ou des lois ou réglementations en vigueur.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Comportement inapproprié ou illégal (par exemple violence, menaces ou atteinte à la vie privée) à notre égard, envers l\'une des sociétés avec lesquelles nous travaillons ou envers toute autre personne.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '- Etc.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Si nous annulons une réservation pour les raisons ci-dessus énoncées, vous n\'aurez droit à aucun remboursement.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Nous pouvons vous indiquer la raison pour laquelle nous avons annulé votre réservation, sauf si cela (a) est contraire aux lois en vigueur et/ou (b) nous empêche de détecter ou prévenir toute fraude ou toute autre activité illégale.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Toutefois, si vous pensez que nous avons annulé votre réservation par erreur, veuillez contacter notre service client.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '10 - Droit applicable et juridiction compétente',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Le présent contrat est régi par la législation ivoirienne notamment par la loi ivoirienne n°2013-546 du 30 juillet 2013 relative aux transactions électroniques et la loi ivoirienne n°2016-412 du 15 juin 2016 relative à la consommation.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'En cas de litige non résolu à l\'amiable entre le client et l\'éditeur ou entre le prestataire de services et l\'éditeur, les juridictions ivoiriennes ont entière compétence pour régler le contentieux.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '11 - Évolution des conditions générales de vente',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'L\'éditeur du site HATOOH-CI.COM et des applications HATOOH se réserve le droit de modifier les clauses de ces conditions générales de vente à tout moment et pour les nécessités techniques.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '12 - Prise d\'effet',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: 22,
                  color: gris_pur,
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'La durée du présent contrat est indéterminée. Le contrat produit ses effets à l\'égard du client et des partenaires (prestataires de services) à compter du début de l\'utilisation des services sur le site web HATOOH-CI.COM ou sur les applications HATOOH.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: text_noir,
                ),
              ),
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
